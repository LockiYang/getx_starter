import 'package:dio/dio.dart';

import '../../../../common/http/http_util.dart';
import '../../../../common/http/http_exception.dart';
import '../../../../common/http/transformer/http_transformer.dart';

class EyepetizerHttpTransformer extends HttpTransformer {
  @override
  T? transform<T>(Response response, {Success<T>? success, Fail? fail}) {
    if (response.data != null && response.data.toString().isNotEmpty) {
      T data = response.data;
      if (success != null) {
        success.call(data);
      }
      return data;
    } else {
      HttpException exception = ServiceException(message: '未返回数据');
      if (fail != null) {
        fail.call(exception);
        return null;
      } else {
        throw exception;
      }
    }
  }

  /// 单例对象
  static final EyepetizerHttpTransformer _instance =
      EyepetizerHttpTransformer._internal();

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  EyepetizerHttpTransformer._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory EyepetizerHttpTransformer.getInstance() => _instance;
}
