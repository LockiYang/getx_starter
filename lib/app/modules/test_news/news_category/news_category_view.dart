import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/modules/test_news/news_category/widgets/news_page_list.dart';

import 'news_category_controller.dart';

class NewsCategoryView extends GetView<NewsCategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewsPageList()
    );
  }
}
