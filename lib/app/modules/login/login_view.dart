import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/common/colors/style.dart';
import 'package:getx_test/app/common/size.dart';
import 'package:getx_test/app/common/size_extention.dart';
import 'package:getx_test/app/components/btn.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Image.asset('assets/images/bg_login_header.png')
            Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  'assets/images/bg_login_header.png',
                  width: 375.spW(),
                  height: 476.spH(),
                  fit: BoxFit.fitWidth,
                )),
            Column(
              children: [
                Spacer(),
                ClipPath(
                  clipper: LoginClipper(),
                  child: Container(
                    color: Colors.white,
                    width: double.maxFinite,
                    padding: EdgeInsets.all((32)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'Login',
                          style: titleTextStyle,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Your Email',
                          style: bodyTextStyle,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        LoginInput(
                            hintText: 'Email',
                            prefixIcon: 'assets/icons/icon_email.png',
                            obscureText: false),
                        SizedBox(height: 16),
                        Text(
                          'Your Password',
                          style: bodyTextStyle,
                        ),
                        SizedBox(height: 4),
                        LoginInput(
                          hintText: 'Password',
                          prefixIcon: 'assets/icons/icon_pwd.png',
                          obscureText: true,
                        ),
                        SizedBox(height: 32),
                        Row(
                          children: [
                            Spacer(),
                            GradientBtnWidget(
                              width: 160,
                              child: Row(children: [
                                SizedBox(
                                  width: 34,
                                ),
                                Text(
                                  'Login',
                                  style: btnTextStyle.copyWith(
                                      color: Colors.white),
                                ),
                                Spacer(),
                                Image.asset(
                                  'assets/icons/icon_arrow_right.png',
                                  width: iconSize,
                                  height: iconSize,
                                ),
                                SizedBox(
                                  width: 24,
                                )
                              ]),
                              onTap: () {
                                Get.back();
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).padding.bottom)
              ],
            ),
            Positioned(
              top: 64,
              left: 28,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: iconBoxSize,
                  height: iconBoxSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Image.asset(
                    'assets/icons/icon_back.png',
                    width: iconSize,
                    height: iconSize,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class LoginInput extends StatelessWidget {
  const LoginInput({Key? key, this.hintText, this.prefixIcon, this.obscureText})
      : super(key: key);
  final String? hintText;
  final String? prefixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        prefixIcon: Container(
          width: iconBoxSize,
          height: iconBoxSize,
          alignment: Alignment.center,
          child: Image.asset(prefixIcon!, width: iconSize, height: iconSize),
        ),
      ),
      obscuringCharacter: '*',
      obscureText: obscureText!,
      style: bodyTextStyle.copyWith(fontSize: 18),
    );
  }
}

///登录页面剪裁曲线
class LoginClipper extends CustomClipper<Path> {
  // 第一个点
  Point p1 = Point(0.0, 54.0);
  Point c1 = Point(20.0, 25.0);
  Point c2 = Point(81.0, -8.0);
  // 第二个点
  Point p2 = Point(160.0, 20.0);
  Point c3 = Point(216.0, 38.0);
  Point c4 = Point(280.0, 73.0);
  // 第三个点
  Point p3 = Point(280.0, 44.0);
  Point c5 = Point(280.0, -11.0);
  Point c6 = Point(330.0, 8.0);

  @override
  Path getClip(Size size) {
    // 第四个点
    Point p4 = Point(size.width, .0);

    Path path = Path();
    // 移动到第一个点
    path.moveTo(p1.x.toDouble(), p1.y.toDouble());
    //第一阶段 三阶贝塞尔曲线
    path.cubicTo(c1.x.toDouble(), c1.y.toDouble(), c2.x.toDouble(),
        c2.y.toDouble(), p2.x.toDouble(), p2.y.toDouble());
    //第二阶段 三阶贝塞尔曲线
    path.cubicTo(c3.x.toDouble(), c3.y.toDouble(), c4.x.toDouble(),
        c4.y.toDouble(), p3.x.toDouble(), p3.y.toDouble());
    //第三阶段 三阶贝塞尔曲线
    path.cubicTo(c5.x.toDouble(), c5.y.toDouble(), c6.x.toDouble(),
        c6.y.toDouble(), p4.x.toDouble(), p4.y.toDouble());
    // 连接到右下角
    path.lineTo(size.width, size.height);
    // 连接到左下角
    path.lineTo(0, size.height);
    //闭合
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return hashCode != oldClipper.hashCode;
  }
}
