import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../common/http/config/dio_config.dart';
import '../../../../common/http/http_client.dart';
import '../../../test_wanandroid/common/http/default_http_transformer.dart';
import '../models/banner.dart';
import '../models/post.dart';
import '../models/post_list.dart';

class JobApi extends GetxService {
  late HttpClient client;

  Future<JobApi> init() async {
    DioConfig config = DioConfig(baseUrl: 'http://120.78.15.132:16011/api/v1/');
    client = HttpClient(dioConfig: config);
    return this;
  }

  Options options = Options(headers: {
    "Authorization": "Bearer ",
    "appType": '51ykt',
    "city": Uri.encodeComponent('深圳'),
    "Content-Type": 'application/json'
  });

  /// 首页banner轮播图
  getBanners({Success<List<Banner>>? success}) {
    client.get('banner/list?position=HOME',
        options: options,
        httpTransformer: EyepetizerHttpTransformer.getInstance(),
        success: (data) {
      var result = (data as List<dynamic>)
          .map((e) => Banner.fromJson(e as Map<String, dynamic>))
          .toList();
      if (success != null) {
        success(result);
      }
    });
  }

  /// 首页分类
  getCategory({Success<List<Post_list>>? success}) {
    client.get('/postList/list',
        options: options,
        httpTransformer: EyepetizerHttpTransformer.getInstance(),
        success: (data) {
      var result = (data as List<dynamic>)
          .map((e) => Post_list.fromJson(e as Map<String, dynamic>))
          .toList();
      if (success != null) {
        success(result);
      }
    });
  }

  /// 分类列表
  getPostPage(int category, {Success<List<Post>>? success}) {
    client.get('/post/list?pageNum=1&pageSize=10&postList=' + category.toString(),
        options: options,
        httpTransformer: EyepetizerHttpTransformer.getInstance(),
        success: (data) {
      var result = ((data as  Map<String, dynamic>)['result'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList();
      if (success != null) {
        success(result);
      }
    });
  }
}
