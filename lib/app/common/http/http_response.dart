

import 'package:getx_test/app/common/http/http_exception.dart';

/// 返回数据类型
class HttpResponse {
  late bool ok;
  dynamic data;
  HttpException? error;

  // HttpResponse._internal({this.ok = false});

  HttpResponse.success(this.data) {
    ok = true;
  }

  HttpResponse.fail({String? errMsg, int? errCode}) {
    error = BadRequestException(message: errMsg, code: errCode);
    ok = false;
  }

  HttpResponse.failFormResponse({dynamic data}) {
    error = BadResponseException(data);
    ok = false;
  }

  HttpResponse.failFromError([HttpException? error]) {
    this.error = error ?? UnknownException();
    ok = false;
  }
}