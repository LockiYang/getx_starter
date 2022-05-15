import 'package:get/get.dart';

import 'test_eyepetizer_controller.dart';

class TestEyepetizerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestEyepetizerController>(
      () => TestEyepetizerController(),
    );
  }
}
