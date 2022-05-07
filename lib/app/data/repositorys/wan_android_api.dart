import 'package:get/get.dart';

import '../../common/http/config/dio_config.dart';
import '../../common/http/http_client.dart';
import '../models/banner.dart';
import '../models/project.dart';

typedef SuccessPaging<T> = Function(T data, int total);

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
    }, fail: (exception) {
      if (fail != null) fail(exception);
    });
  }

  ///获取项目列表
  Future<ProjectPage> getProjects(int page,
      {SuccessPaging<dynamic>? success, Fail? fail}) async {
    var uri =
        'article/listproject/page/json'.replaceFirst(RegExp('page'), '$page');
    dynamic result = await client.get(uri, fail: (exception) {
      if (fail != null) fail(exception);
    });

    return ProjectPage.fromJson(result as Map<String, dynamic>);
  }
}
