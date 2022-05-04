import 'package:get/get.dart';

import 'news_category_controller.dart';

class NewsCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsCategoryController>(
      () => NewsCategoryController(),
    );
  }
}
