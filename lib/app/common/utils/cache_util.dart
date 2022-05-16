import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/user.dart';


/// App缓存工具类
class CacheUtil {
  static const String keyUserInfo = 'user_info';

  ///存储用户信息
  static putUserInfo(User user) {
    Get.find<SharedPreferences>()
        .setString(keyUserInfo, jsonEncode(user.toJson()));
  }

  ///获取用户信息
  static User? getUserInfo() {
    try {
      var json = Get.find<SharedPreferences>().getString(keyUserInfo);
      if (json == null) {
        return null;
      } else {
        return User.fromJson(jsonDecode(json));
      }
    } catch (e) {
      return null;
    }
  }

  ///删除用户信息
  static deleteUserInfo() {
    Get.find<SharedPreferences>().remove(keyUserInfo);
  }
}
