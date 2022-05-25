import 'package:flutter/material.dart';
import 'package:fluwx_no_pay/fluwx_no_pay.dart';
import 'package:get/get.dart';

class SdkWechatController extends GetxController {
  String? result = '无';
  @override
  void onInit() {
    super.onInit();
    register();
    weChatResponseEventHandler.listen((res) {
      debugPrint("===wxresult" + res.isSuccessful.toString());
      if (res is WeChatLaunchMiniProgramResponse) {
        result = 'isSuccessful:${res.isSuccessful}';

        update();
      } else {}
    });
  }

  register() async {
    await registerWxApi(
        appId: 'wx1103ecce1d6a32e8',
        universalLink: 'https://as.sdwyjob.com/',
        doOnAndroid: true,
        doOnIOS: true);
  }

  @override
  void onClose() {}

  tapLaunchWeChatMiniProgram() {
    // pages/success/success?subscribeId=' + subscribeId + '&appType=' + APP_TYPE
    launchWeChatMiniProgram(
        username: 'gh_daad6647b053',
        path: 'pages/home/home',
        miniProgramType: WXMiniProgramType.RELEASE);
  }

  tapOpenWechat() {
    openWeChatApp();
  }
}
