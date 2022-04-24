import 'package:dio/dio.dart';

/// HTTP配置类
class HttpConfig {
  final String? baseUrl;
  final String? proxy;
  final String? cookiedPath;
  final List<Interceptor>? interceptors;
  final int connectTimeout;
  final int sendTimeout;
  final int receiveTimeout;
  final Map<String, dynamic>? headers;

  HttpConfig({
    this.baseUrl,
    this.proxy,
    this.cookiedPath,
    this.interceptors,
    this.headers,
    this.connectTimeout = Duration.millisecondsPerMinute,
    this.sendTimeout = Duration.millisecondsPerMinute,
    this.receiveTimeout = Duration.millisecondsPerMinute
  });
}