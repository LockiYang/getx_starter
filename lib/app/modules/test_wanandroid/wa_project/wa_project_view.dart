import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_project/widgets/project_list_item.dart';

import '../../../common/getx/getz_view_keep_alive.dart';
import '../../../common/widgets/paging_refresher.dart';
import 'wa_project_controller.dart';

class WaProjectView extends GetzViewKeepAlive<WaProjectController> {
  WaProjectView({Key? key}) : super(key: key) {
    Get.put<WaProjectController>(WaProjectController());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            top: true,
            child: PagingRefreshWidget<WaProjectController>(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return ProjectListItem(controller.data[index]);
                    }))));
  }
}
