import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../common/styles/zstyle_constants.dart';
import 'wa_feedback_controller.dart';
import 'widgets/feedback_photo_select_widget.dart';

class WaFeedbackView extends GetView<WaFeedbackController> {
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                ..issue
                ..update(),
              minLines: 5,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                '上传截图（选填）',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              alignment: Alignment.centerLeft,
            ),
            SizedBox(
              height: 10,
            ),
            FeedbackPhotoSelectWidget(),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                '联系方式（选填）',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              alignment: Alignment.centerLeft,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: '请输入验证码',
                    hintStyle: TextStyle(
                        fontSize: 16,
                        height: 1,
                        color: ZStyleConstans.colorTextHint),
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
                style: TextStyle(fontSize: 16, height: 1),
                onChanged: (value) => {}),
            SizedBox(
              height: 50,
            ),
            BrnBigOutlineButton(
              title: '提交',
              onTap: () => controller.requestFeedback(context),
            )
          ],
        ),
      ),
    );
  }
}
