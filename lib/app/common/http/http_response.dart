import 'http_exception.dart';

class HttpResponse<T> {
  late bool ok = false;
  T? data;
  HttpException? exception;

  HttpResponse.success(this.data) {
    ok = true;
  }

  HttpResponse.fail({String? errorMsg, int? errorCode}) {
    exception = BadRequestException(message: errorMsg, code: errorCode);
    ok = false;
  }

  HttpResponse.failFromError([HttpException? error]) {
    exception = error ?? UnknownException();
    ok = false;
  }
}
