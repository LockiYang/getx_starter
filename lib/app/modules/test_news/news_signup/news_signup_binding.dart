import 'package:get/get.dart';

import 'news_signup_controller.dart';

class NewsSignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsSignupController>(
      () => NewsSignupController(),
    );
  }
}
