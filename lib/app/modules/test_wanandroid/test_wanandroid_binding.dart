import 'package:get/get.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_home/wa_home_controller.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_my/wa_my_controller.dart';

import 'test_wanandroid_controller.dart';
import 'wa_home/wa_main/wa_main_controller.dart';

class TestWanandroidBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put<TestWanandroidController>(
    //   TestWanandroidController(), tag: 'TestWanandroidController'
    // );
    // Get.put<WaHomeController>(
    //   WaHomeController(), tag: 'WaHomeController'
    // );
    // Get.put<WaMainController>(
    //   WaMainController(), tag: 'WaMainController'
    // );
    // Get.put<WaMyController>(
    //   WaMyController(), tag: 'WaMyController'
    // );
    // Get.put<WaMyController>(
    //   WaMyController(), tag: 'WaMyController'
    // );
    
    Get.put<TestWanandroidController>(
      TestWanandroidController()
    );
    Get.put<WaHomeController>(
      WaHomeController()
    );
    Get.put<WaMainController>(
      WaMainController()
    );
    Get.put<WaMyController>(
      WaMyController()
    );
  }
}
