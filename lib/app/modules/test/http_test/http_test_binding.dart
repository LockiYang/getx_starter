import 'package:get/get.dart';

import 'http_test_controller.dart';

class HttpTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HttpTestController>(
      () => HttpTestController(),
    );
  }
}
