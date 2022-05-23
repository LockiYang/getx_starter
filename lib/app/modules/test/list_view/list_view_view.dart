import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/common/getx/getz_view_keep_alive.dart';
import 'package:getx_test/app/modules/test/list_view/list_view_binding.dart';

import '../widgets/demo_tabs.dart';
import 'list_view_controller.dart';

class ListViewView extends GetzViewKeepAlive<ListViewController> {
  @override
  Widget build(BuildContext context) {
    return DemoTabs(
        title: 'ListView',
        demos: controller.demos,
        tabScrollable: true,
        tabController: controller.tabController);
  }

  @override
  Bindings? binding() {
    return ListViewBinding();
  }
}
