import 'package:get/get.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_home/wa_main/wa_main_controller.dart';

import 'wa_home_controller.dart';

class WaHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaHomeController>(
      () => WaHomeController(),
    );
    Get.lazyPut<WaMainController>(
      () => WaMainController(),
    );
  }
}
