import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_project/widgets/project_list_item.dart';

import '../../../common/widgets/pull_smart_refresher.dart';
import 'wa_project_controller.dart';

class WaProjectView extends GetView<WaProjectController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: true,
      child: RefreshWidget<WaProjectController>(
          child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: controller.projects.length,
              itemBuilder: (context, index) {
                return ProjectListItem(controller.projects[index]);
              })),
    ));
  }
}
