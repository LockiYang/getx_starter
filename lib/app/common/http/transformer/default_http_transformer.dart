import 'package:dio/dio.dart';
import '../http_util.dart';
import '../http_exception.dart';
import 'http_transformer.dart';

class DefaultHttpTransformer extends HttpTransformer {
  @override
  T? transform<T>(Response response, {Success<T>? success, Fail? fail}) {
    // 成功则解析出data<T>回调success，不成功解析出errCode和errMsg回调fail
    if (response.data["errorCode"] == 0) {
      T data = response.data["data"];
      // 回调函数执行点
      if (success != null) {
        success.call(data);
      }
      return data;
    } else {
      //后台errorCode不为0，返回了异常，获取业务异常代码封装
      HttpException exception = BussinessException(
          code: response.data["errorCode"], message: response.data["errorMsg"]);
      if (fail != null) {
        fail.call(exception);
        return null;
      } else {
        throw exception;
      }
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
