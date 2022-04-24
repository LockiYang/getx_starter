import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/common/colors/color.dart';
import 'package:getx_test/app/common/colors/style.dart';
import 'package:getx_test/app/common/size.dart';
import 'package:getx_test/app/common/size_extention.dart';
import 'package:getx_test/app/components/btn.dart';
import 'package:getx_test/app/routes/app_pages.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.initScreen(context);
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(fit: StackFit.expand, children: [
        // Welcome Header
        Stack(
          children: [
            Image.asset(
              "assets/images/bg_welcome_header.png",
              width: 375.spW(),
              height: 542.spH(),
              fit: BoxFit.fitWidth,
            ),
            Positioned(
                top: 194.spH(),
                left: 40.spW(),
                child: Column(
                  children: [
                    Container(
                      width: iconBoxSize,
                      height: iconBoxSize,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/icons/app_icon.png',
                        width: 24,
                        height: 32,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Sour',
                      style: titleTextStyle,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Best drink\nreceipes',
                      style: bodyTextStyle,
                    ),
                  ],
                ))
          ],
        ),
        // Welcome footer
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(children: [
            GradientBtnWidget(
              width: 208,
              child: Text(
                'Sign up',
                style: btnTextStyle.copyWith(color: Colors.white),
              ),
              onTap: () {},
            ),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              child: Container(
                width: 208,
                height: 48,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: btnShadow,
                    borderRadius: BorderRadius.circular(btnRadius)),
                alignment: Alignment.center,
                child: Text('Login', style: btnTextStyle),
              ),
              onTap: () {
                Get.toNamed(Routes.LOGIN);
              },
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Forgot password?',
              style: TextStyle(fontSize: 18, color: textColor),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Spacer(),
                SizedBox(
                  width: 80,
                  child: Divider(color: textColor),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(
                    'assets/icons/logo_ins.png',
                    width: 16,
                    height: 16,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(
                    'assets/icons/logo_fb.png',
                    width: 16,
                    height: 16,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(
                    'assets/icons/logo_twitter.png',
                    width: 16,
                    height: 16,
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Divider(color: textColor),
                ),
                Spacer()
              ],
            ),
            // 底部安全距离
            SafeArea(
              top: false,
              child: SizedBox(height: 16),
            ),
          ]),
        )
      ]),
    );
  }
}