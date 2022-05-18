import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/common/getx/getz_view_binding.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_project/wa_project_binding.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_project/widgets/project_list_item.dart';

import '../../../common/widgets/paging_refresher.dart';
import 'wa_project_controller.dart';

class WaProjectView extends GetzViewBindng<WaProjectController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            top: true,
            bottom: false,
            child: PagingRefreshWidget<WaProjectController>(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return ProjectListItem(controller.data[index]);
                    }))));
  }

  @override
  Bindings? binding() {
    return WaProjectBinding();
  }
}
