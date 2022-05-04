import 'package:get/get.dart';
import 'package:getx_test/app/modules/test_news/news_category/news_category_controller.dart';
import 'package:getx_test/app/modules/test_news/news_home/news_home_controller.dart';

import 'news_index_controller.dart';

class NewsIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsIndexController>(
      () => NewsIndexController(),
    );
    Get.lazyPut<NewsHomeController>(
      () => NewsHomeController(),
    );
    Get.lazyPut<NewsCategoryController>(
      () => NewsCategoryController(),
    );
  }
}
