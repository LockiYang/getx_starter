import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/common/getx/getz_view_binding.dart';
import 'package:getx_test/app/modules/app_job/job_message/job_message_binding.dart';
import 'package:getx_test/app/modules/app_job/widgets/course_message_item.dart';

import 'job_message_controller.dart';

class JobMessageView extends GetzViewBindng<JobMessageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('消息'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
          children: [1, 2, 3].map((e) {
        return CourseMessageItem();
      }).toList()),
    );
  }

  @override
  Bindings? binding() {
    return JobMessageBinding();
  }
}
