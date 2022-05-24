import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_test/app/modules/app_job/data/models/index.dart';
import 'package:getx_test/app/modules/app_job/services/config_service.dart';

import '../../../common/services/cache_service.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

  String token = '';
  final _isLogin = false.obs;
  final _profile = Login_info().obs;
  final username = ''.obs;

  bool get isLogin => _isLogin.value;
  Login_info get profile => _profile.value;
  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    token = CacheService.to.getString(ConfigService.cackeKeyUserToken) ?? '';
    var profileOffline =
        CacheService.to.getString(ConfigService.cacheKeyUserProfile) ?? '';
    if (profileOffline.isNotEmpty) {
      _profile(Login_info.fromJson(jsonDecode(profileOffline)));
      username.value =
          _profile.value.username.replaceFirst(RegExp(r'\d{4}'), '****', 3);
      _isLogin.value = true;
    }
  }

  /// 保存token
  Future<void> saveToken(String token) async {
    await CacheService.to.setString(ConfigService.cackeKeyUserToken, token);
    this.token = token;
  }

  /// 获取profile
  // Future<void> getProfile() async {
  //   if (token.isEmpty) return;
  //   var result = await UserAPI.profile();
  //   _profile(result);
  //   _isLogin.value = true;
  //   CacheService.to.setString(
  //       NewsConfigService.STORAGE_USER_PROFILE_KEY, jsonEncode(result));
  // }

  /// 保存profile
  Future<void> saveProfile(Login_info profile) async {
    _isLogin.value = true;
    username.value = profile.username.replaceFirst(RegExp(r'\d{4}'), '****', 3);

    CacheService.to
        .setString(ConfigService.cacheKeyUserProfile, jsonEncode(profile));
  }

  // 注销
  Future<void> logout() async {
    // if (_isLogin.value) await UserAPI.logout();
    await CacheService.to.remove(ConfigService.cackeKeyUserToken);
    await CacheService.to.remove(ConfigService.cacheKeyUserProfile);
    token = '';
    _isLogin.value = false;
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
