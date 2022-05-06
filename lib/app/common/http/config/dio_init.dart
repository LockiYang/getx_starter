import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';

import 'dio_config.dart';

/// Dio配置类
class DioInit with DioMixin implements Dio {
  DioInit({BaseOptions? options, DioConfig? dioConfig}) {
    options ??= BaseOptions(
      baseUrl: dioConfig?.baseUrl ?? '',
      contentType: Headers.jsonContentType,
      connectTimeout: dioConfig?.connectTimeout,
      sendTimeout: dioConfig?.sendTimeout,
      receiveTimeout: dioConfig?.receiveTimeout,
    )..headers = dioConfig?.headers;
    this.options = options;

    // Dio Cache Interceptor
    final cacheOptions = CacheOptions(
      store: MemCacheStore(),
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 7),
    );
    interceptors.add(DioCacheInterceptor(options: cacheOptions));

    // debug Interceptor
    if (kDebugMode) {
      interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: false,
          responseHeader: false,
          request: false,
          requestBody: true));
    }

    // other Interceptor
    if (dioConfig?.interceptors?.isNotEmpty ?? false) {
      interceptors.addAll(dioConfig!.interceptors!);
    }

    // Cookie管理
    // if (dioConfig?.cookiesPath?.isNotEmpty ?? false) {
    //   interceptors.add(CookieManager(
    //       PersistCookieJar(storage: FileStorage(dioConfig!.cookiesPath))));
    // }

    httpClientAdapter = DefaultHttpClientAdapter();
    if (dioConfig?.proxy?.isNotEmpty ?? false) {
      String proxy = dioConfig!.proxy!;
      (httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (uri) {
          // proxy all request to localhost:8888
          return "PROXY $proxy";
        };
        return null;
      };
    }
  }
}
