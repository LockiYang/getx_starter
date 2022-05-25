import 'dart:io';

import 'package:dio/dio.dart';
import 'package:getx_test/app/common/http/http_util.dart';
import 'transformer/default_http_transformer.dart';
import 'http_exception.dart';
import 'transformer/http_transformer.dart';

/// HTTP status >=200 & <300
T? handleResponse<T>(Response? response,
    {HttpTransformer? httpTransformer, Success<T>? success, Fail? fail}) {
  httpTransformer ??= DefaultHttpTransformer.getInstance();

  if (response == null || !_isRequestSuccess(response.statusCode)) {
    return _handleError(UnknownException(), fail: fail);
  } else {
    return httpTransformer.transform(response, success: success, fail: fail);
  }
}

// HTTP status <200 & >=300
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
      case DioErrorType.response: //wrong incorrect HTTP status
        try {
          int? statusCode = error.response?.statusCode;
          // int? errCode = error.response?.data; // 可能有业务异常需要处理
          switch (statusCode) {
            case 400:
              return RequestException(message: "请求语法错误", code: statusCode);
            case 401:
              return UnauthorisedException(message: "没有权限", code: statusCode);
            case 403:
              return RequestException(message: "服务器拒绝执行", code: statusCode);
            case 404:
              return RequestException(message: "无法连接服务器", code: statusCode);
            case 405:
              return RequestException(message: "请求方法被禁止", code: statusCode);
            case 500:
              return ServiceException(message: "服务器内部错误", code: statusCode);
            case 502:
              return ServiceException(message: "无效的请求", code: statusCode);
            case 503:
              return ServiceException(message: "服务器挂了", code: statusCode);
            case 505:
              return ServiceException(message: "不支持HTTP协议请求", code: statusCode);
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
