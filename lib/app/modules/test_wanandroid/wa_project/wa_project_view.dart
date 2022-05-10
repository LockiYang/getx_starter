import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_project/widgets/project_list_item.dart';

import '../../../common/widgets/paging_refresher.dart';
import 'wa_project_controller.dart';

class WaProjectView extends GetView<WaProjectController> {
  WaProjectView({Key? key}) : super(key: key) {
    Get.put<WaProjectController>(WaProjectController());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            top: true,
            child: GetBuilder<WaProjectController>(
              // 此处可以用GetBuilder或GetView注入的WaProjectController都可以
              builder: (c) =>
                  PagingRefreshWidget<WaProjectController>(
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: c.data.length,
                          itemBuilder: (context, index) {
                            return ProjectListItem(c.data[index]);
                          })),
            )));
  }
}
