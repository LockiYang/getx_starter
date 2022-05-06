import 'package:get/get.dart';

import '../../common/http/config/dio_config.dart';
import '../../common/http/http_client.dart';
import '../models/banner.dart';
import '../models/project.dart';

typedef SuccessOver<T> = Function(T data, bool over);

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

  ///获取项目列表
  getProjects(int page, {SuccessOver<List<Project>>? success, Fail? fail}) {
    client.get('article/listproject/page/json'.replaceFirst(RegExp('page'), '$page'),
        success: (data) {
      ProjectPage page = ProjectPage.fromJson(data as Map<String, dynamic>);
      var result = page.datas.map((e) => Project.fromJson(e)).toList();
      if (success != null) success(result, page.over);
    }, fail: (code, msg) {
      if (fail != null) fail(code, msg);
    });
  }
}
