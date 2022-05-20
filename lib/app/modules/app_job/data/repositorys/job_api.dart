import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../common/http/config/dio_config.dart';
import '../../../../common/http/http_client.dart';
import '../../../test_wanandroid/common/http/eyepetizer_http_transformer.dart';
import '../models/banner.dart';
import '../models/login_info.dart';
import '../models/pagination.dart';
import '../models/post.dart';
import '../models/post_list.dart';
import '../models/user_info.dart';

typedef SuccessPagination<T> = Function(T data, Pagination page);

class JobApi extends GetxService {
  late HttpClient client;

  Future<JobApi> init() async {
    DioConfig config = DioConfig(baseUrl: 'http://120.78.15.132:16011/api/v1/');
    client = HttpClient(dioConfig: config);
    return this;
  }

  Options options = Options(headers: {
    'Authorization': 'Bearer ',
    'appType': '51ykt',
    'city': Uri.encodeComponent('深圳'),
    'Content-Type': 'application/json',
    'x-appStoreUuid': 'apasykt',
    'x-appVersion': '1.0.1'
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
    client.get('postList/list',
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

  /// 岗位列表
  getPostPage(int category, int pageNum,
      {SuccessPagination<List<Post>>? success}) {
    client.get('post/list',
        queryParameters: {
          'pageNum': pageNum,
          'pageSize': 10,
          'postList': category.toString()
        },
        options: options,
        httpTransformer: EyepetizerHttpTransformer.getInstance(),
        success: (data) {
      var page = Pagination.fromJson((data as Map)['pagination']);

      var result = ((data as Map<String, dynamic>)['result'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList();
      if (success != null) {
        success(result, page);
      }
    });
  }

  /// 岗位详情
  getPostInfo(int postId, {Success<Post>? success}) {
    client.get('post/info',
        queryParameters: {
          'postId': postId.toString()
        },
        options: options,
        httpTransformer: EyepetizerHttpTransformer.getInstance(),
        success: (data) {
      var result = Post.fromJson(data as Map<String, dynamic>);
      if (success != null) {
        success(result);
      }
    });
  }

  /// 获取短信验证码
  postSmsCode(String mobile, {Success<Login_info>? success}) {
    client.post('auth/sms',
        queryParameters: {
          'mobile': mobile
        },
        options: options,
        httpTransformer: EyepetizerHttpTransformer.getInstance(),
        success: (data) {
      var result = Login_info.fromJson(data as Map<String, dynamic>);
      if (success != null) {
        success(result);
      }
    });
  }

  /// 获取短信验证码
  postLoginByMobile(String mobile, String sms,  {Success<Login_info>? success}) {
    client.post('auth/login-by-mobile',
        queryParameters: {
          'mobile': mobile,
          'sms': sms
        },
        options: options,
        httpTransformer: EyepetizerHttpTransformer.getInstance(),
        success: (data) {
      var result = Login_info.fromJson(data as Map<String, dynamic>);
      if (success != null) {
        success(result);
      }
    });
  }

  /// 获取用户信息
  getUserInfo({Success<User_info>? success}) {
    client.post('user/info',
        options: options,
        httpTransformer: EyepetizerHttpTransformer.getInstance(),
        success: (data) {
      var result = User_info.fromJson(data as Map<String, dynamic>);
      if (success != null) {
        success(result);
      }
    });
  }

  /// 删除账户
  deleteAccount({Success<User_info>? success}) {
    client.post('user/info',
        options: options,
        httpTransformer: EyepetizerHttpTransformer.getInstance(),
        success: (data) {
      var result = User_info.fromJson(data as Map<String, dynamic>);
      if (success != null) {
        success(result);
      }
    });
  }



}
