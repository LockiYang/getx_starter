import 'package:get/get.dart';

import 'sdk_umeng_controller.dart';

class SdkUmengBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SdkUmengController>(
      () => SdkUmengController(),
    );
  }
}
