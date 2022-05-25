import 'package:dio/dio.dart';
import 'package:getx_test/app/common/http/http_exception.dart';
import 'package:getx_test/app/common/http/transformer/default_http_transformer.dart';

import 'config/dio_init.dart';
import 'config/dio_config.dart';
import 'response_handler.dart';
import 'transformer/http_transformer.dart';

typedef Success<T> = Function(T data);
typedef Fail = Function(HttpException exception);

class HttpUtil {
  late final DioInit _dio;
  final HttpTransformer transformer;
  final Options? options;

  HttpUtil({
    BaseOptions? baseOptions,
    DioConfig? dioConfig,
    HttpTransformer? httpTransformer,
    this.options,
  })  : _dio = DioInit(options: baseOptions, dioConfig: dioConfig),
        transformer = httpTransformer ?? DefaultHttpTransformer.getInstance();

  Future<T?> get<T>(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    HttpTransformer? httpTransformer,
    Success<T>? success,
    Fail? fail,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options ?? this.options,
        cancelToken: cancelToken, //通过cancel token来取消发起的请求
        onReceiveProgress: onReceiveProgress, //接收进度
      );

      // HTTP status >=200 & <300
      return handleResponse<T>(response,
          httpTransformer: httpTransformer ?? transformer,
          success: success,
          fail: fail);
    } on Exception catch (e) {
      // HTTP status <200 & >=300
      return handleException(e, fail: fail);
    }
  }

  Future post<T>(
    String uri, {
    data,
    bool? isJson = false,
    Map<String, dynamic>? queryParameters,
    Options? options,
    HttpTransformer? httpTransformer,
    Success<T>? success,
    Fail? fail,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options ?? this.options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      handleResponse<T>(response,
          httpTransformer: httpTransformer ?? transformer,
          success: success,
          fail: fail);
    } on Exception catch (e) {
      handleException(e, fail: fail);
    }
  }

  Future patch<T>(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    HttpTransformer? httpTransformer,
    Success<T>? success,
    Fail? fail,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options ?? this.options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      handleResponse<T>(response,
          httpTransformer: httpTransformer ?? transformer,
          success: success,
          fail: fail);
    } on Exception catch (e) {
      handleException(e, fail: fail);
    }
  }

  Future delete<T>(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    HttpTransformer? httpTransformer,
    Success<T>? success,
    Fail? fail,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options ?? this.options,
        cancelToken: cancelToken,
      );
      handleResponse<T>(response,
          httpTransformer: httpTransformer ?? transformer,
          success: success,
          fail: fail);
    } on Exception catch (e) {
      handleException(e, fail: fail);
    }
  }

  Future put<T>(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    HttpTransformer? httpTransformer,
    Success<T>? success,
    Fail? fail,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options ?? this.options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      handleResponse<T>(response,
          httpTransformer: httpTransformer, success: success, fail: fail);
    } on Exception catch (e) {
      handleException(e, fail: fail);
    }
  }

  Future<Response> download(String urlPath, savePath,
      {ProgressCallback? onReceiveProgress,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      bool deleteOnError = true,
      String lengthHeader = Headers.contentLengthHeader,
      data,
      Options? options}) async {
    try {
      var response = await _dio.download(
        urlPath,
        savePath,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        deleteOnError: deleteOnError, //发生错误时候是否删除已下载的文件
        lengthHeader: lengthHeader, //源文件的实际大小
        data: data,
        options: options,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  callbackSuccess<T>(Success<T>? success, T data) {
    if (success != null) {
      success.call(data);
    }
  }

  callbackFial(Fail? fail, HttpException error) {
    if (fail != null) {
      fail.call(error);
    }
  }
}
