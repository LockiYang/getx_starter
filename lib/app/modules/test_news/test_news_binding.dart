import 'package:get/get.dart';

import 'test_news_controller.dart';

class TestNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestNewsController>(
      () => TestNewsController(),
    );
  }
}
