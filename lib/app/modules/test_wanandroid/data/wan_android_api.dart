import 'package:get/get.dart';

import '../../../common/http/config/dio_config.dart';
import '../../../common/http/http_util.dart';
import '../../../common/widgets/banner/banner_model.dart';
import 'project.dart';

typedef SuccessPaging<T> = Function(T data, int total);

class WanAndroidApi extends GetxService {
  late HttpUtil client;

  Future<WanAndroidApi> init() async {
    DioConfig config = DioConfig(baseUrl: 'https://www.wanandroid.com/');
    client = HttpUtil(dioConfig: config);
    return this;
  }

  /// 首页banner轮播图
  getBanners({Success<List<BannerModel>>? success}) {
    client.get('banner/json', success: (data) {
      var result = (data as List<dynamic>)
          .map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
          .toList();
      if (success != null) {
        success(result);
      }
    });
  }

  /// 获取项目列表
  Future<ProjectPage> getProjects(int page, {Fail? fail}) async {
    var uri =
        'article/listproject/page/json'.replaceFirst(RegExp('page'), '$page');
    dynamic result = await client.get(uri, fail: (exception) {
      if (fail != null) fail(exception);
    });

    return ProjectPage.fromJson(result as Map<String, dynamic>);
  }

  /// 获取文章列表
  Future<ProjectPage> getArticles(int page, {Fail? fail}) async {
    var uri = 'article/list/page/json'.replaceFirst(RegExp('page'), '$page');
    dynamic result = await client.get(uri, fail: (exception) {
      if (fail != null) fail(exception);
    });

    return ProjectPage.fromJson(result as Map<String, dynamic>);
  }

  /// 我的收藏列表
  Future<ProjectPage> getMyCollet(int page, {Fail? fail}) async {
    var uri = 'lg/collect/list/page/json'.replaceFirst(RegExp('page'), '$page');
    dynamic result = await client.get(uri, fail: (exception) {
      if (fail != null) fail(exception);
    });

    return ProjectPage.fromJson(result as Map<String, dynamic>);
  }

  /// 用户登录接口
  login(String username, String password,
      {Success<dynamic>? success, Fail? fail}) {
    client.post('user/login',
        data: {"username": username, "password": password}, success: (data) {
      if (success != null) {
        success(data);
      }
    }, fail: (exception) {
      if (fail != null) fail(exception);
    });
  }

  logout({
    Success<bool>? success,
    Fail? fail,
  }) {
    client.post('user/logout/json');
  }
}
