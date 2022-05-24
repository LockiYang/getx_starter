import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/common/getx/getz_view.dart';
import 'package:getx_test/app/common/styles/zstyle_constants.dart';
import 'package:getx_test/app/common/utils/toast_util.dart';
import 'package:getx_test/app/common/widgets/button/basic_button.dart';

import '../../../common/styles/zstyle.dart';
import '../widgets/shake_widget.dart';
import '../widgets/triangle_widget.dart';
import 'job_login_controller.dart';

class JobLoginView extends GetzView<JobLoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                Spacez.hSpacezSm,
                Text(
                  '立即登录，解锁高薪兼职',
                  style: ZStyle.textHeadLg,
                )
              ],
            ),
            Spacez.vSpacezXs,
            Text(
              '未注册过的手机号将自动创建账号',
              style: Get.textTheme.caption,
            ),
            Spacez.vSpacezXl,
            Row(
              children: [
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      '+86',
                      style: TextStyle(fontSize: 16, height: 1),
                    )),
                SizedBox(
                  width: 1,
                  height: 12,
                  child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: ZStyleConstans.dividerColorBase),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: '请输入手机号',
                        hintStyle: TextStyle(fontSize: 18, height: 1),
                        border: InputBorder.none),
                    style: TextStyle(fontSize: 18, height: 1),
                    onChanged: controller.phoneNumChange,
                  ),
                ),
              ],
            ),
            Dividerz.dividerH1,
            Spacez.vSpacezSm,
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    // focusNode: controller.smsCodeFocus,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(4) //限制长度
                    ],
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: '请输入验证码',
                        hintStyle: TextStyle(fontSize: 18, height: 1),
                        border: InputBorder.none),
                    style: TextStyle(fontSize: 18, height: 1),
                    onChanged: controller.smsCodeChange,
                  ),
                ),
                SizedBox(
                  width: 1,
                  height: 12,
                  child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: ZStyleConstans.dividerColorBase),
                  ),
                ),
                GestureDetector(
                  onTap: controller.countDown > 0
                      ? () => {}
                      : () => controller.postSmscode(),
                  child: Container(
                    alignment: Alignment.center,
                    width: 150,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      controller.countDown > 0
                          ? '${controller.countDown}s重新获取'
                          : '获取验证码',
                      style: TextStyle(
                          fontSize: 16,
                          height: 1,
                          fontWeight: FontWeight.w600,
                          color: controller.countDown > 0
                              ? ZStyleConstans.colorTextSecondary
                              : ZStyleConstans.brandPrimary),
                      // strutStyle: StrutStyle(forceStrutHeight: true, leading: 0.2),
                    ),
                  ),
                )
              ],
            ),
            Divider(
              height: 1,
            ),
            Spacez.vSpacezXxl,
            ExRoundTriangleWidget(data: '我测试看看',),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShakeWidget(
                  key: controller.shakeKey,
                  child: BrnCheckbox(
                    radioIndex: 1,
                    isSelected: controller.protocalChecked,
                    onValueChangedAtIndex: (index, status) =>
                        controller.changeChecked(status),
                    child: Row(
                      children: [
                        Text(
                          '已阅读并同意',
                        ),
                        GestureDetector(
                          onTap: () => ToastUtil.show('阅读用户协议'),
                          child: Text(
                            '用户协议',
                            style:
                                TextStyle(color: ZStyleConstans.brandPrimary),
                          ),
                        ),
                        Text(
                          '和',
                        ),
                        GestureDetector(
                          onTap: () => ToastUtil.show('阅读隐私协议'),
                          child: Text(
                            '隐私协议',
                            style:
                                TextStyle(color: ZStyleConstans.brandPrimary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Spacez.vSpacezMd,
            BasicButtom(
              isEnable: controller.isSubmitEnable,
              text: '立即登录',
              alignment: Alignment.center,
              onTap: () => controller.login(),
            )
          ]),
        ),
      ),
    );
  }
}
