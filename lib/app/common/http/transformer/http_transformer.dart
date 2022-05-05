import 'package:dio/dio.dart';

import '../http_response.dart';

///返回数据脱壳，拿到解析后的data
abstract class HttpTransformer {
  HttpResponse parse(Response response);
}