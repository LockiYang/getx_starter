import 'package:flutter/material.dart';
import 'package:getx_test/app/common/getx/getz_view.dart';
import 'package:getx_test/app/common/styles/zstyle_constants.dart';
import 'package:getx_test/app/modules/app_job/widgets/course_item.dart';

import '../../../common/widgets/over_scroll_behavior.dart';
import '../services/config_service.dart';
import 'job_browser_mode_controller.dart';

class JobBrowserModeView extends GetzView<JobBrowserModeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${ConfigService.appName}'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 44,
              color: ZStyleConstans.colorTextSecondary,
              child: Text(
                '当前正处于浏览模式，更多惊喜在等待',
                style: TextStyle(color: Colors.white),
              )),
          Expanded(
            child: ScrollConfiguration(
              behavior: OverScrollBehavior(),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.posts.length,
                  itemBuilder: ((context, index) => CourseItem(
                        post: controller.posts[index],
                        showBottom: false,
                        browserMode: true,
                        onTap: controller.tapItem,
                      ))),
            ),
          )
        ],
      ),
    );
  }
}
