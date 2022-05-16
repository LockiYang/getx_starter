import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:umeng_common_sdk/umeng_common_sdk.dart';

/// 发送自定义事件（目前属性值支持字符、整数、浮点、长整数，暂不支持NULL、布尔、MAP、数组）
/// UmengCommonSdk.onEvent("VideoPlay", {"userID":"神秘账号", "channel":"wx", "playTime":10});
///
/// 登录用户账号
/// UmengCommonSdk.onProfileSignIn("user_id");
///
/// 登出用户账号
/// UmengCommonSdk.onProfileSignOff();
///
/// 手动采集页面信息
/// UmengCommonSdk.setPageCollectionModeManual();
///
/// 自动采集页面信息
/// UmengCommonSdk.setPageCollectionModeAuto();
///
/// 进入页面统计（手动采集时才可设置）
/// UmengCommonSdk.onPageStart("viewName");
///
/// 离开页面统计（手动采集时才可设置）
/// UmengCommonSdk.onPageEnd("viewName");
class SdkUmengController extends GetxController {
  String platformVersion = 'Unknown';

  initUmeng() async {
    try {
      platformVersion = (await UmengCommonSdk.platformVersion)!;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    UmengCommonSdk.initCommon(
        '5e3f96f3cb23d2a070000048', '5e3f96f3cb23d2a070000048', 'Umeng');
    UmengCommonSdk.setPageCollectionModeManual();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
