import 'package:dio/dio.dart';

/// Dio配置类
class DioConfig {
  final String? baseUrl;
  final String? proxy;
  final String? cookiedPath;
  final List<Interceptor>? interceptors;
  final Map<String, dynamic>? headers;
  final int connectTimeout;
  final int sendTimeout;
  final int receiveTimeout;

  DioConfig(
      {this.baseUrl,
      this.proxy,
      this.cookiedPath,
      this.interceptors,
      this.headers,
      this.connectTimeout = Duration.millisecondsPerMinute,
      this.sendTimeout = Duration.millisecondsPerMinute,
      this.receiveTimeout = Duration.millisecondsPerMinute});
}
