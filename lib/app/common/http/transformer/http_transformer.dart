import 'package:dio/dio.dart';

import '../http_client.dart';

///返回数据脱壳，拿到解析后的data
abstract class HttpTransformer {
  parse<T>(Response response, {Success<T>? success, Fail? fail});
}
