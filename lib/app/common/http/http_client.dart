import 'package:dio/dio.dart';

import 'config/dio_init.dart';
import 'config/dio_config.dart';
import 'http_parse.dart';
import 'transformer/http_transformer.dart';

typedef Success<T> = Function(T data);
typedef Fail = Function(int errCode, String errMsg);

class HttpClient {
  late final DioInit _dio;

  HttpClient({BaseOptions? options, DioConfig? dioConfig})
      : _dio = DioInit(options: options, dioConfig: dioConfig);

  Future get<T>(String uri,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress,
      HttpTransformer? httpTransformer,
      Success<T>? success,
      Fail? fail}) async {
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken, //通过cancel token来取消发起的请求
        onReceiveProgress: onReceiveProgress, //接收进度
      );
      handleResponse<T>(response,
          httpTransformer: httpTransformer, success: success, fail: fail);
    } on Exception catch (e) {
      handleException(e, fail: fail);
    }
  }

  Future post<T>(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      HttpTransformer? httpTransformer,
      Success<T>? success,
      Fail? fail}) async {
    try {
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
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

  Future patch<T>(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      HttpTransformer? httpTransformer,
      Success<T>? success,
      Fail? fail}) async {
    try {
      var response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
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

  Future delete<T>(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      HttpTransformer? httpTransformer,
      Success<T>? success,
      Fail? fail}) async {
    try {
      var response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      handleResponse<T>(response,
          httpTransformer: httpTransformer, success: success, fail: fail);
    } on Exception catch (e) {
      handleException(e, fail: fail);
    }
  }

  Future put<T>(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      HttpTransformer? httpTransformer,
      Success<T>? success,
      Fail? fail}) async {
    try {
      var response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
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
        options: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
