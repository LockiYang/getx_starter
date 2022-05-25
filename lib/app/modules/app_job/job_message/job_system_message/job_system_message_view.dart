import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/zstyle_constants.dart';
import 'job_system_message_controller.dart';

class JobSystemMessageView extends GetView<JobSystemMessageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('系统消息'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text(
            '暂无系统消息',
            style: TextStyle(color: ZStyleConstans.colorTextSecondary),
          ),
        ),
      ),
    );
  }
}
