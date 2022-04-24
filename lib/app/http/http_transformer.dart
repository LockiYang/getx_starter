import 'package:dio/dio.dart';

import 'http_response.dart';

abstract class HttpTransformer {
  HttpResponse parse(Response response);
}