import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_test/app/modules/app_job/data/models/index.dart';
import 'package:getx_test/app/modules/app_job/services/config_service.dart';

import '../../../common/services/cache_service.dart';
import '../data/repositorys/job_api.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

  Login_info profile = Login_info();

  String token = '';
  final isLogin = false.obs;
  final userId = 0.obs;
  final username = ''.obs;

  final collectNum = 0.obs;
  final historyNum = 0.obs;

  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    token = CacheService.to.getString(ConfigService.cackeKeyUserToken) ?? '';
    var profileOffline =
        CacheService.to.getString(ConfigService.cacheKeyUserProfile) ?? '';
    if (profileOffline.isNotEmpty) {
      // 已经登录
      profile = Login_info.fromJson(jsonDecode(profileOffline));
      isLogin.value = true;
      userId.value = profile.userId.toInt();
      username.value =
          profile.username.replaceFirst(RegExp(r'\d{4}'), '****', 3);
    }
  }

  /// 登录-保存token
  Future<void> saveToken(String token) async {
    this.token = token;
    isLogin.value = true;
    await CacheService.to.setString(ConfigService.cackeKeyUserToken, token);
  }

  /// 登录-保存profile
  Future<void> saveProfile(Login_info profile) async {
    username.value = profile.username.replaceFirst(RegExp(r'\d{4}'), '****', 3);
    userId.value = profile.userId.toInt();
    await CacheService.to
        .setString(ConfigService.cacheKeyUserProfile, jsonEncode(profile));
  }

  // 注销
  Future<void> logout() async {
    token = '';
    isLogin.value = false;
    username.value = '';
    userId.value = 0;
    await CacheService.to.remove(ConfigService.cackeKeyUserToken);
    await CacheService.to.remove(ConfigService.cacheKeyUserProfile);
  }

  notifyCollectNum() {
    if (isLogin.value) {
      // 获取收藏数
      JobApi.to.getCollectnum(success: (data) {
        collectNum.value = data;
      });
    } else {
      collectNum.value = 0;
    }
  }

  notifyHistoryNum() {
    if (isLogin.value) {
      historyNum.value = getBrowseHistoryLength();
    } else {
      historyNum.value = 0;
    }
  }

  // 浏览历史记录
  saveBrowseHistory(Post post) {
    var history = getBrowseHistory();
    for (var element in history) {
      Map<String, dynamic> map = jsonDecode(element);
      var convert = Post.fromJson(map);
      if (convert.postId == post.postId) {
        return;
      }
    }
    var toJson = jsonEncode(post.toJson());
    history.insert(0, toJson);
    CacheService.to
        .setStringList(ConfigService.cacheKeyuserBrowseHistory, history);
  }

  ///浏览记录JSON转换为Model之后的数据
  List<Post> getBrowseHistoryModel() {
    var data = <Post>[];
    var history = getBrowseHistory();
    for (var element in history) {
      var map = jsonDecode(element);
      var convert = Post.fromJson(map);
      data.add(convert);
    }
    return data;
  }

  ///浏览记录长度
  int getBrowseHistoryLength() {
    return getBrowseHistory().length;
  }

  ///获取浏览历史记录
  List<String> getBrowseHistory() {
    try {
      var json = CacheService.to
          .getStringList(ConfigService.cacheKeyuserBrowseHistory);
      return json ?? [];
    } catch (e) {
      return [];
    }
  }
}
