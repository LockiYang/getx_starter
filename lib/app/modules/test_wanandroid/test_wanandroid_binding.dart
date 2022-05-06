import 'package:get/get.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_project/wa_project_controller.dart';

import 'test_wanandroid_controller.dart';

class TestWanandroidBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestWanandroidController>(
      () => TestWanandroidController(),
    );
    Get.lazyPut<WaProjectController>(
      () => WaProjectController(),
    );
  }
}
