import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';

void interceptors(dio) {
  /// 日志
  dio.interceptors.add(HttpFormatter());
  /// Cookie
  dio.interceptors.add(CookieManager(CookieJar()));
}
