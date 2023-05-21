import 'dart:convert';

import 'package:riverine/config/constant.dart';
import 'package:riverine/http/base_entity.dart';
import 'package:riverine/http/error_handle.dart';
import 'package:riverine/http/interceptors.dart';
import 'package:riverine/http/white_list.dart';
import 'package:riverine/modules/login/login_logic.dart';
import 'package:riverine/route/route_config.dart';
import 'package:riverine/store/store.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:get_storage/get_storage.dart';

Duration _connectTimeout = Duration(seconds: 15);
Duration _receiveTimeout = Duration(seconds: 15);
Duration _sendTimeout = Duration(seconds: 10);
String _baseUrl = Constant.SERVICE_API_URL;

class Http {
  factory Http() => _singleton;

  Http._() {
    final BaseOptions _options = BaseOptions(
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      sendTimeout: _sendTimeout,
      responseType: ResponseType.plain,
      validateStatus: (_) {
        return true;
      },
      baseUrl: _baseUrl,
    );
    _dio = Dio(_options);
    interceptors(dio);
  }

  static final Http _singleton = Http._();

  static Http get instance => Http();

  static late Dio _dio;

  Dio get dio => _dio;

  ///await/async方式
  Future<BaseEntity<T>> network<T>(
    Method method,
    String url, {
    dynamic params,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    try {
      final result = await _requestWork<T>(
        method.value,
        url,
        data: params,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      if (result.code == 401) {
        if (!Get.isRegistered<LoginLogic>()) {
          await StoreLogic.to.whenSignOut();
          Get.offAllNamed(RouteConfig.login);
        }
      }
      return result;
    } catch (e) {
      _cancelLogPrint(e, url);
      final NetError error = ExceptionHandle.handleException(e);
      return BaseEntity(error.code ?? ExceptionHandle.unknown_error, error.msg ?? '未知异常', null);
    }
  }

  // 数据返回格式统一，统一处理异常
  Future<BaseEntity<T>> _requestWork<T>(
    String method,
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    final Response<String> response = await _dio.request<String>(
      url,
      data: data,
      queryParameters: queryParameters,
      options: _checkOptions(method, options, url),
      cancelToken: cancelToken,
    );
    try {
      final String data = response.data.toString();
      final bool isCompute = data.length > 10 * 1024;
      final Map<String, dynamic> _map = isCompute ? await compute(parseData, data) : parseData(data);
      return BaseEntity<T>.fromJson(_map);
    } catch (e) {
      debugPrint(e.toString());
      return BaseEntity<T>(ExceptionHandle.parse_error, '数据解析错误！', null);
    }
  }

  Options _checkOptions(String method, Options? options, String path) {
    options ??= Options();
    options.method = method;
    Map<String, dynamic>? _authorization = getAuthorizationHeader(path: path);
    if (_authorization != null) {
      options = options.copyWith(headers: _authorization);
    }
    return options;
  }

  void _cancelLogPrint(dynamic e, String url) {
    if (e is DioError && CancelToken.isCancel(e)) {
      print('取消请求接口： $url');
    }
  }

  Map<String, dynamic>? getAuthorizationHeader({path}) {
    Map<String, dynamic>? headers;
    // final _token = GetStorage().read<String>(Constant.keyToken);
    if (!whiteList.contains(path)) {
      /*if (_token!.isNotEmpty) {
        headers = {
          'Authorization': 'Bearer $_token',
        };
      }*/
    } else {
      print('path白名单过滤');
    }
    return headers;
  }
}

Map<String, dynamic> parseData(String data) {
  return json.decode(data) as Map<String, dynamic>;
}

enum Method { get, post, put, patch, delete, head }

/// 使用拓展枚举替代 switch判断取值
extension MethodExtension on Method {
  String get value => ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD'][index];
}
