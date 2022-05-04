import 'package:get/get.dart';

import 'news_signin_controller.dart';

class NewsSigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsSigninController>(
      () => NewsSigninController(),
    );
  }
}
