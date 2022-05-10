import 'package:get/get.dart';

import 'wa_setting_controller.dart';

class WaSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaSettingController>(
      () => WaSettingController(),
    );
  }
}
