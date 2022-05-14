import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/demo_tabs.dart';
import 'widgets/color_grids.dart';
import 'widgets/guess_like_list.dart';
import 'widgets/service_categories.dart';

class GridViewController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<DemoTabViewModel> demos = [
    DemoTabViewModel(title: '彩色格子', widget: ColorGrids()),
    DemoTabViewModel(title: '美团 - 服务菜单', widget: ServiceCategories()),
    DemoTabViewModel(title: '喜马拉雅 - 相声列表', widget: GuessLikeList()),
  ];

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: demos.length, vsync: this);
  }


  @override
  void onClose() {}
}
