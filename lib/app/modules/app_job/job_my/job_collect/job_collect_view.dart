import 'package:flutter/material.dart';
import 'package:getx_test/app/common/getx/getz_view.dart';
import 'package:getx_test/app/modules/app_job/widgets/course_message_item.dart';

import '../../../../common/widgets/paging_refresher.dart';
import 'job_collect_controller.dart';

class JobCollectView extends GetzView<JobCollectController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的收藏'),
        centerTitle: true,
      ),
      body: PagingRefreshWidget<JobCollectController>(
          child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return CourseMessageItem(post: controller.data[index]);
              })),
    );
  }
}
