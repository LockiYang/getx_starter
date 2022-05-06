import 'package:get/get.dart';

import '../../common/http/config/dio_config.dart';
import '../../common/http/http_client.dart';
import '../models/banner.dart';

class WanAndroidApi extends GetxService {
  late HttpClient client;

  Future<WanAndroidApi> init() async {
    DioConfig config = DioConfig(baseUrl: 'https://www.wanandroid.com/');
    client = HttpClient(dioConfig: config);
    return this;
  }

  ///首页banner轮播图
  getBanners({Success<List<Banner>>? success, Fail? fail}) {
    client.get('banner/json', success: (data) {
      var result = (data as List<dynamic>)
          .map((e) => Banner.fromJson(e as Map<String, dynamic>))
          .toList();
      if (success != null) success(result);
    }, fail: (code, msg) {
      if (fail != null) fail(code, msg);
    });
  }
}
