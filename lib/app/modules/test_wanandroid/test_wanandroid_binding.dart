import 'package:get/get.dart';

import 'test_wanandroid_controller.dart';

class TestWanandroidBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestWanandroidController>(
      () => TestWanandroidController(),
    );
  }
}
