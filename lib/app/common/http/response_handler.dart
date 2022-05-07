import 'dart:io';

import 'package:dio/dio.dart';
import 'package:getx_test/app/common/http/http_client.dart';
import 'transformer/default_http_transformer.dart';
import 'http_exception.dart';
import 'transformer/http_transformer.dart';

T? handleResponse<T>(Response? response,
    {HttpTransformer? httpTransformer, Success<T>? success, Fail? fail}) {
  httpTransformer ??= DefaultHttpTransformer.getInstance();

  // 返回值异常
  if (response == null) {
    return _handleError(UnknownException(), fail: fail);
  } else if (_isTokenTimeout(response.statusCode)) {
    // token失效
    return _handleError(
        UnauthorisedException(message: "没有权限", code: response.statusCode),
        fail: fail);
  } else if (_isRequestSuccess(response.statusCode)) {
    // 接口调用成功
    return httpTransformer.transform(response, success: success, fail: fail);
  } else {
    // 接口调用失败，HTTP状态码异常
    // TODO 也可能有服务器业务异常
    return _handleError(BadRequestException(
        message: response.statusMessage, code: response.statusCode));
  }
}

handleException(Exception exception, {Fail? fail}) {
  var parseException = _transformException(exception);
  return _handleError(parseException, fail: fail);
}

_handleError(HttpException exception, {Fail? fail}) {
  if (fail != null) {
    fail.call(exception);
    return null;
  } else {
    throw exception;
  }
}

/// 鉴权失败
bool _isTokenTimeout(int? code) {
  return code == 401;
}

/// 请求成功
bool _isRequestSuccess(int? statusCode) {
  return (statusCode != null && statusCode >= 200 && statusCode < 300);
}

/// 转换异常
HttpException _transformException(Exception error) {
  if (error is DioError) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        return NetworkException(message: error.message);
      case DioErrorType.cancel:
        return CancelException(error.message);
      case DioErrorType.response:
        try {
          int? errCode = error.response?.statusCode;
          switch (errCode) {
            case 400:
              return BadRequestException(message: "请求语法错误", code: errCode);
            case 401:
              return UnauthorisedException(message: "没有权限", code: errCode);
            case 403:
              return BadRequestException(message: "服务器拒绝执行", code: errCode);
            case 404:
              return BadRequestException(message: "无法连接服务器", code: errCode);
            case 405:
              return BadRequestException(message: "请求方法被禁止", code: errCode);
            case 500:
              return BadServiceException(message: "服务器内部错误", code: errCode);
            case 502:
              return BadServiceException(message: "无效的请求", code: errCode);
            case 503:
              return BadServiceException(message: "服务器挂了", code: errCode);
            case 505:
              return UnauthorisedException(
                  message: "不支持HTTP协议请求", code: errCode);
            default:
              return UnknownException(error.message);
          }
        } on Exception catch (_) {
          return UnknownException(error.message);
        }

      case DioErrorType.other:
        if (error.error is SocketException) {
          return NetworkException(message: error.message);
        } else {
          return UnknownException(error.message);
        }
      default:
        return UnknownException(error.message);
    }
  } else {
    return UnknownException(error.toString());
  }
}
