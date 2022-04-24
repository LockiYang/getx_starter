import 'package:dio/dio.dart';
import 'http_response.dart';
import 'http_transformer.dart';

class DefaultHttpTransformer extends HttpTransformer {
  @override
  HttpResponse parse(Response response) {
    if (response.data["status"] == 100) {
      return HttpResponse.success(response.data["data"]);
    } else if (response.data["code"] == 1 && response.data["msg"] == "成功") {
      return HttpResponse.success(response.data["data"]);
    } else {
      return HttpResponse.fail(
          errMsg: response.data["message"], errCode: response.data["code"]);
    }
  }

  /// 单例对象
  static final DefaultHttpTransformer _instance = DefaultHttpTransformer._internal();

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  DefaultHttpTransformer._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory DefaultHttpTransformer.getInstance() => _instance;
}
