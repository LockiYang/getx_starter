import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/common/no_splash_factory.dart';

import 'lib_color_schemes.g.dart';

///一、颜色
///关键颜色
///重点色 Primary Secondary Tertiary
///中性色
///
///二、字体
/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5

const appColorPrimary = Color.fromARGB(255, 243, 52, 211);
const appColorSuccess = Color(0xff10dc60);
const appColorWarning = Color(0xffFF794C);
const appColorDanger = Color(0xffF20A23);

const appColorDark = Color(0xff333333);
const appColorGray = Color(0xff666666);
const appColorMedium = Color(0xff999999);
const appColorlight = Color(0xffececec);
const appColorWhite = Color(0xffffffff);

const appColorDivider = Color(0xffececec);
const appColorBackground = Color(0xfff8f8f8);

class AppTheme {
  static ThemeData light = ThemeData(
    colorScheme: lightColorScheme,
    splashColor: Colors.transparent,
    splashFactory: NoSplashFactory(),
    highlightColor: Colors.transparent,
    appBarTheme: ThemeData.light().appBarTheme.copyWith(
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shadowColor: Colors.transparent,
          titleTextStyle: Get.theme.textTheme.bodyText1,
          toolbarTextStyle: Get.theme.textTheme.bodyText1,
        ),
    textTheme: ThemeData.light().textTheme.copyWith(),
    // buttonTheme:
  );

  static ThemeData dark = ThemeData(
    colorScheme: darkColorScheme,
  );
}
