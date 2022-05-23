import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/common/styles/zstyle.dart';
import 'package:getx_test/app/common/widgets/button/basic_button.dart';

import '../../../../common/styles/zstyle_constants.dart';
import 'job_feedback_controller.dart';

class JobFeedbackView extends GetView<JobFeedbackController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('问题反馈'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              child: Text(
                '问题反馈*',
                style: ZStyle.textSubHead,
              ),
              alignment: Alignment.centerLeft,
            ),
            SizedBox(
              height: 10,
            ),
            BrnInputText(
              hint: '您可以在这里输入反馈的内容',
              borderColor: ZStyleConstans.borderColorBase,
              padding: EdgeInsets.all(10),
              borderRadius: ZStyleConstans.radiusMd,
              onTextChange: (text) => controller
                ..issue = text
                ..update(),
              minLines: 5,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                '联系方式（选填）',
                style: ZStyle.textSubHead,
              ),
              alignment: Alignment.centerLeft,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: '请输入联系方式',
                    hintStyle: TextStyle(
                        fontSize: 16, color: ZStyleConstans.colorTextHint),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: ZStyleConstans.borderColorBase, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: ZStyleConstans.borderColorBase, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: ZStyleConstans.borderColorBase, width: 1))),
                style: TextStyle(fontSize: 16),
                onChanged: (value) => controller
                  ..contact = value
                  ..update()),
            SizedBox(
              height: 50,
            ),
            BasicButtom(text: '提交', onTap: () => controller.requestFeedback()),
          ],
        ),
      ),
    );
  }
}
