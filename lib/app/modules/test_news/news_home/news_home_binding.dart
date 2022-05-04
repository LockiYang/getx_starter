import 'package:get/get.dart';

import 'news_home_controller.dart';

class NewsHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsHomeController>(
      () => NewsHomeController(),
    );
  }
}
