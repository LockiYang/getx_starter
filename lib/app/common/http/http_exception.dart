/// HTTP异常
class HttpException implements Exception {
  final int? _code;
  final String? _message;
  int get code => _code ?? -1;
  String get message => _message ?? runtimeType.toString();

  HttpException([this._message, this._code]);
}

/// 客户端请求异常
class RequestException extends HttpException {
  RequestException({int? code, String? message}) : super(message, code);
}

/// 服务器异常
class ServiceException extends HttpException {
  ServiceException({int? code, String? message}) : super(message, code);
}

/// 业务异常
class BussinessException extends HttpException {
  BussinessException({int? code, String? message}) : super(message, code);
}

/// 未认证异常
class UnauthorisedException extends HttpException {
  UnauthorisedException({int? code = 401, String? message}) : super(message);
}

class UnknownException extends HttpException {
  UnknownException([String? message]) : super(message);
}

class CancelException extends HttpException {
  CancelException([String? message]) : super(message);
}

class NetworkException extends HttpException {
  NetworkException({int? code, String? message}) : super(message, code);
}
