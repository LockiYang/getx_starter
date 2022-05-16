import 'package:get/get.dart';

import 'sdk_wechat_controller.dart';

class SdkWechatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SdkWechatController>(
      () => SdkWechatController(),
    );
  }
}
