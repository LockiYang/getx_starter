import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/utils/cache_util.dart';
import '../../../common/utils/toast_util.dart';
import '../../../data/models/user.dart';
import '../../../data/repositorys/wan_android_api.dart';
import '../../../routes/app_pages.dart';

class WaLoginController extends GetxController {
  late WanAndroidApi wanAndroidApi;
  bool protocalChecked = true;
  String username = '';
  String password = '';

  changeChecked(value) {
    debugPrint(value.toString());
    protocalChecked = value;
    update();
  }

  login() {
    if (username.isEmpty || password.isEmpty) {
      return;
    }

    wanAndroidApi.login(username, password, success: (data) {
      var loginUser = User.fromJson(data);
      loginUser.password = password;
      CacheUtil.putUserInfo(loginUser);
      // Get.offAllNamed(Routes.TEST_WANANDROID);
      Get.until((route) => Get.currentRoute == Routes.TEST_WANANDROID);
    }, fail: (error){
      ToastUtil.show(error.message);
    });
  }

  @override
  void onInit() {
    super.onInit();
    wanAndroidApi = Get.find<WanAndroidApi>();
  }


  @override
  void onClose() {}
}
