import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/utils/cache_util.dart';
import '../../../data/models/user.dart';

class WaMyController extends GetxController {
  User? loginUser;

  /// 路由回传，更新页面数据
  void routeCallback() {
    debugPrint('update my page');
    notifyUserInfo();
  }

  /// 更新用户信息，每次进入时更新
  void notifyUserInfo() {
    var info = CacheUtil.getUserInfo();
    if (info != null) {
      loginUser = info;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    notifyUserInfo();
  }

  @override
  void onClose() {}
}
