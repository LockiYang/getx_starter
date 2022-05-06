import 'package:dio/dio.dart';
import '../http_client.dart';
import 'http_transformer.dart';

class DefaultHttpTransformer extends HttpTransformer {
  @override
  parse<T>(Response response, {Success<T>? success, Fail? fail}) {
    if (response.data["errorCode"] == 0) {
      if (success != null) success(response.data["data"]);
    } else {
      //后台errorCode不为0，返回了异常
      if (fail != null) fail(response.data["errorCode"], response.data["errorMsg"]);
    }
  }

  /// 单例对象
  static final DefaultHttpTransformer _instance =
      DefaultHttpTransformer._internal();

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  DefaultHttpTransformer._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory DefaultHttpTransformer.getInstance() => _instance;
}
