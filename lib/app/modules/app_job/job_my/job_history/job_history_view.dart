import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/modules/app_job/services/user_service.dart';
import 'package:getx_test/app/modules/app_job/widgets/course_message_item.dart';

import 'job_history_controller.dart';

class JobHistoryView extends GetView<JobHistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('历史'),
        centerTitle: true,
      ),
      body: ListView.builder(
          shrinkWrap: false, // 是否根据子组件的总长度来设置ListView的长度
          itemCount: UserService.to.getBrowseHistoryLength(),
          itemBuilder: (context, index) {
            return CourseMessageItem(
              post: UserService.to.getBrowseHistoryModel()[index],
              showBottom: false,
            );
          }),
    );
  }
}
