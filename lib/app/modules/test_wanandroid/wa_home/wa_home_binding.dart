import 'package:get/get.dart';

import 'wa_home_controller.dart';

class WaHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaHomeController>(
      () => WaHomeController(),
    );
  }
}
