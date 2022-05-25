import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/common/getx/getz_view_binding.dart';
import 'package:getx_test/app/common/widgets/menu_list_tile.dart';
import 'package:getx_test/app/modules/app_job/job_message/job_message_binding.dart';
import 'package:getx_test/app/modules/app_job/widgets/course_message_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../common/styles/zstyle_constants.dart';
import '../../../routes/app_pages.dart';
import 'job_message_controller.dart';

class JobMessageView extends GetzViewBindng<JobMessageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '消息',
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SmartRefresher(
            controller: controller.refreshController,
            enablePullDown: true,
            enablePullUp: true,
            onLoading: controller.loadingData,
            onRefresh: controller.refreshData,
            child: CustomScrollView(physics: ClampingScrollPhysics(), slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.fromLTRB(ZStyleConstans.hSpacingSm,
                      ZStyleConstans.hSpacingSm, ZStyleConstans.hSpacingSm, 0),
                  padding: EdgeInsets.symmetric(
                      horizontal: ZStyleConstans.hSpacingSm),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(ZStyleConstans.radiusSm),
                      color: Colors.white),
                  height: 60,
                  child: MenuListTile(
                    title: '系统消息',
                    icon: Icons.notifications,
                    iconColor: Colors.red,
                    onTap: () => Get.toNamed(Routes.JOB_SYSTEM_MESSAGE),
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return CourseMessageItem(
                  post: controller.data[index],
                );
              }, childCount: controller.data.length))
            ])));
  }

  @override
  Bindings? binding() {
    return JobMessageBinding();
  }
}
