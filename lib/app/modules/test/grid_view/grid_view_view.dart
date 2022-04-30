import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../widgets/demo_tabs.dart';
import 'grid_view_controller.dart';

class GridViewView extends GetView<GridViewController> {
  @override
  Widget build(BuildContext context) {
    return DemoTabs(
        title: 'Grid View',
        demos: controller.demos,
        tabScrollable: true,
        tabController: controller.tabController);
  }
}
