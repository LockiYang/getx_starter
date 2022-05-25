import 'http_exception.dart';

/// 返回数据封装
class HttpResponse<T> {
  late bool ok = false;
  T? data;
  HttpException? exception;

  HttpResponse.success(this.data) {
    ok = true;
  }

  HttpResponse.fail({String? errorMsg, int? errorCode}) {
    exception = RequestException(message: errorMsg, code: errorCode);
    ok = false;
  }

  HttpResponse.failFromError([HttpException? error]) {
    exception = error ?? UnknownException();
    ok = false;
  }
}
