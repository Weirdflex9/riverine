import 'package:dio_http_formatter/dio_http_formatter.dart';

void interceptors(dio) {
  /// 日志
  dio.interceptors.add(HttpFormatter());
}
