import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../widgets/demo_tabs.dart';
import 'list_view_controller.dart';

class ListViewView extends GetView<ListViewController> {
  @override
  Widget build(BuildContext context) {
    return DemoTabs(
        title: 'ListView',
        demos: controller.demos,
        tabScrollable: true,
        tabController: controller.tabController);
  }
}
