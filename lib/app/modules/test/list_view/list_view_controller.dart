import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/demo_tabs.dart';
import 'widgets/builder_usage.dart';
import 'widgets/normal_usage.dart';
import 'widgets/pull_down_refresh_usage.dart';
import 'widgets/pull_up_load_more_usage.dart';
import 'widgets/separated_usage.dart';

class ListViewController extends GetxController with GetSingleTickerProviderStateMixin {

  List<DemoTabViewModel> demos = [
  DemoTabViewModel(title: '普通用法', widget: NormalList()),
  DemoTabViewModel(title: 'builder用法', widget: SubscribeAccountList()),
  DemoTabViewModel(title: 'separated用法', widget: FriendList()),
  DemoTabViewModel(title: '下拉刷新用法', widget: PullDownRefreshList()),
  DemoTabViewModel(title: '上拉加载用法', widget: PullUpLoadMoreList()),
];

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: demos.length, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
