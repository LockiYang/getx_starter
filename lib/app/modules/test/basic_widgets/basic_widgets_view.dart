import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../widgets/demo_tabs.dart';
import 'basic_widgets_controller.dart';

class BasicWidgetsView extends GetView<BasicWidgetsController> {
  @override
  Widget build(BuildContext context) {
    return DemoTabs(
        title: '基础组件',
        demos: controller.demos,
        tabScrollable: true,
        tabController: controller.tabController);
  }
}
