import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/modules/app_job/data/models/index.dart';
import 'package:getx_test/app/modules/app_job/data/models/pagination.dart';
import 'package:getx_test/app/modules/app_job/services/user_service.dart';

import '../../../../common/http/config/dio_config.dart';
import '../../../../common/http/http_client.dart';
import '../../../test_wanandroid/common/http/eyepetizer_http_transformer.dart';

typedef SuccessPagination<T> = Function(T data, Pagination page);

class JobApi extends GetxService {
  static JobApi get to => Get.find();

  late HttpClient client;

  Future<JobApi> init() async {
    DioConfig config = DioConfig(baseUrl: 'http://120.78.15.132:16011/api/v1/');
    client = HttpClient(dioConfig: config);
    return this;
  }

  options() {
    return Options(headers: {
      'Authorization': 'Bearer ' + UserService.to.token,
      'appType': '51ykt',
      'city': Uri.encodeComponent('深圳'),
      'Content-Type': 'application/json',
      'x-appStoreUuid': 'apasykt',
      'x-appVersion': '1.0.1'
    });
  }

  /// 首页banner轮播图
  getBanners({Success<List<Banner>>? success}) {
    client.get('banner/list?position=HOME',
        options: options(),
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
        options: options(),
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
        options: options(),
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

  /// 岗位推荐列表
  Future<Pagination<Post>> getPostRecommendPage(
      String postList, int pageNum) async {
    var result = await client.get('post/listRecommand',
        queryParameters: {
          'pageNum': pageNum,
          'pageSize': 1,
          'postList': postList
        },
        options: options(),
        httpTransformer: EyepetizerHttpTransformer.getInstance());

    var pagination = Pagination<Post>.fromJson(
        (result as Map<String, dynamic>)['pagination']);
    var data = (result['result'] as List<dynamic>)
        .map((e) => Post.fromJson(e as Map<String, dynamic>))
        .toList();
    pagination.data = data;
    return pagination;
  }

  /// 岗位详情
  getPostInfo(int postId, {Success<Post>? success}) {
    client.get('post/info',
        queryParameters: {'postId': postId.toString()},
        options: options(),
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
        queryParameters: {'mobile': mobile},
        options: options(),
        httpTransformer: EyepetizerHttpTransformer.getInstance(),
        success: (data) {
      var result = Login_info.fromJson(data as Map<String, dynamic>);
      if (success != null) {
        success(result);
      }
    });
  }

  /// 获取短信验证码
  postLoginByMobile(String mobile, String sms, {Success<Login_info>? success}) {
    client.post('auth/login-by-mobile',
        queryParameters: {'mobile': mobile, 'sms': sms},
        options: options(),
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
        options: options(),
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
        options: options(),
        httpTransformer: EyepetizerHttpTransformer.getInstance(),
        success: (data) {
      var result = User_info.fromJson(data as Map<String, dynamic>);
      if (success != null) {
        success(result);
      }
    });
  }

  /// 获取app配置信息
  getAppConfig(String channelId, {Success<App_version>? success}) async {
    await client.get('sys/app-version',
        queryParameters: {'uuid': channelId},
        options: options(),
        httpTransformer: EyepetizerHttpTransformer.getInstance(),
        success: (data) {
      var result = App_version.fromJson(data as Map<String, dynamic>);
      if (success != null) {
        success(result);
      }
    });
  }

  /// 保存收藏
  saveCollect(int postId, bool status, {Success<void>? success}) {
    client.post('collect/save',
        queryParameters: {'postId': postId, 'status': status},
        options: options(),
        httpTransformer: EyepetizerHttpTransformer.getInstance(),
        success: (data) {
      if (success != null) {
        success(data);
      }
    });
  }

  /// 获取收藏列表分页
  Future<Pagination<Post>> getCollectPage(int pageNum) async {
    var result = await client.get('collect/list',
        queryParameters: {'pageNum': pageNum, 'pageSize': 1},
        options: options(),
        httpTransformer: EyepetizerHttpTransformer.getInstance());

    var pagination = Pagination<Post>.fromJson(
        (result as Map<String, dynamic>)['pagination']);
    var data = (result['result'] as List<dynamic>)
        .map((e) => Post.fromJson(e as Map<String, dynamic>))
        .toList();
    pagination.data = data;
    return pagination;
  }

  /// 保存日志
  postLog(String name, {Success<void>? success}) {
    client.post('track/log',
        queryParameters: {
          'name': name,
        },
        options: options(),
        httpTransformer: EyepetizerHttpTransformer.getInstance(),
        success: (data) {
      if (success != null) {
        success(data);
      }
    });
  }

  /// 保存日志
  saveSuggest(String content, {Success<void>? success}) {
    client.post('suggest/save',
        queryParameters: {
          'content': content,
        },
        options: options(),
        httpTransformer: EyepetizerHttpTransformer.getInstance(),
        success: (data) {
      if (success != null) {
        success(data);
      }
    });
  }

  /// 获取基本信息表单
  getBasicInfoConfig({Success<dynamic>? success}) async {
    await client.get('sys/virBasicInfo',
        options: options(),
        httpTransformer: EyepetizerHttpTransformer.getInstance(),
        success: (data) {
      if (success != null) {
        success(data);
      }
    });
  }

  /// 获取收藏数
  getCollectnum({Success<dynamic>? success}) async {
    await client.get('collect/totalCollectSum',
        options: options(),
        httpTransformer: EyepetizerHttpTransformer.getInstance(),
        success: (data) {
      if (success != null) {
        success(data);
      }
    });
  }

  /// 获取收藏信息
  getCollectInfo(String postId, {Success<dynamic>? success}) async {
    await client.get('collect/info',
        queryParameters: {
          'postId': postId,
        },
        options: options(),
        httpTransformer: EyepetizerHttpTransformer.getInstance(),
        success: (data) {
      if (success != null) {
        success(data);
      }
    });
  }

  /// 保存用户基本信息
  saveBasicInfo(String extraInfo, {Success<void>? success}) {
    client.post('user/saveBasicInfo',
        queryParameters: {
          'extraInfo': extraInfo,
        },
        options: options(),
        httpTransformer: EyepetizerHttpTransformer.getInstance(),
        success: (data) {
      if (success != null) {
        success(data);
      }
    });
  }
}
