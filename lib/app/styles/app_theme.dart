import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:getx_test/app/common/no_splash_factory.dart';
import 'package:getx_test/app/styles/theme_constants.dart';

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
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),
          // toolbarTextStyle: Get.theme.textTheme.bodyText1,
        ),
    textTheme: ThemeData.light().textTheme.copyWith(
          headline5: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
          // headline6: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          // subtitle1: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          // subtitle2: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          // bodyText1: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
          // bodyText2: TextStyle(fontWeight: FontWeight.normal, fontSize: 14)
        ),
    // buttonTheme:
  );

  static ThemeData dark = ThemeData(
    colorScheme: darkColorScheme,
  );

  static BrnCommonConfig commonConfig = BrnCommonConfig(
      brandPrimary: ThemeConstants.brandPrimary,
      brandPrimaryTap: ThemeConstants.brandPrimaryTap,
      brandSuccess: ThemeConstants.brandSuccess,
      brandWarning: ThemeConstants.brandWarning,
      brandError: ThemeConstants.brandError,
      brandImportant: ThemeConstants.brandImportant,
      brandImportantValue: ThemeConstants.brandImportantValue,
      brandAuxiliary: ThemeConstants.brandAuxiliary,
      colorTextBase: ThemeConstants.colorTextBase,
      colorTextImportant: ThemeConstants.colorTextImportant,
      colorTextBaseInverse: ThemeConstants.colorTextBaseInverse,
      colorTextSecondary: ThemeConstants.colorTextSecondary,
      colorTextDisabled: ThemeConstants.colorTextDisabled,
      colorTextHint: ThemeConstants.colorTextHint,
      colorLink: ThemeConstants.colorLink,
      fillBase: ThemeConstants.fillBase,
      fillBody: ThemeConstants.fillBody,
      fillMask: ThemeConstants.fillMask,
      borderColorBase: ThemeConstants.borderColorBase,
      dividerColorBase: ThemeConstants.dividerColorBase,
      fontSizeBebas: ThemeConstants.fontSizeBebas,
      fontSizeHeadLg: ThemeConstants.fontSizeHeadLg,
      fontSizeHead: ThemeConstants.fontSizeHead,
      fontSizeSubHead: ThemeConstants.fontSizeSubHead,
      fontSizeBase: ThemeConstants.fontSizeBase,
      fontSizeCaption: ThemeConstants.fontSizeCaption,
      fontSizeCaptionSm: ThemeConstants.fontSizeCaptionSm,
      radiusXs: ThemeConstants.radiusXs,
      radiusSm: ThemeConstants.radiusSm,
      radiusMd: ThemeConstants.radiusMd,
      radiusLg: ThemeConstants.radiusLg,
      borderWidthSm: ThemeConstants.borderWidthSm,
      borderWidthMd: ThemeConstants.borderWidthMd,
      borderWidthLg: ThemeConstants.borderWidthLg,
      hSpacingXs: ThemeConstants.hSpacingXs,
      hSpacingSm: ThemeConstants.hSpacingSm,
      hSpacingMd: ThemeConstants.hSpacingMd,
      hSpacingLg: ThemeConstants.hSpacingLg,
      hSpacingXl: ThemeConstants.hSpacingXl,
      hSpacingXxl: ThemeConstants.hSpacingXxl,
      vSpacingXs: ThemeConstants.vSpacingXs,
      vSpacingSm: ThemeConstants.vSpacingSm,
      vSpacingMd: ThemeConstants.vSpacingMd,
      vSpacingLg: ThemeConstants.vSpacingLg,
      vSpacingXl: ThemeConstants.vSpacingXl,
      vSpacingXxl: ThemeConstants.vSpacingXxl,
      iconSizeXxs: ThemeConstants.iconSizeXxs,
      iconSizeXs: ThemeConstants.iconSizeXs,
      iconSizeSm: ThemeConstants.iconSizeSm,
      iconSizeMd: ThemeConstants.iconSizeMd,
      iconSizeLg: ThemeConstants.iconSizeLg);

  static BrnCardTitleConfig cardTitleConfig = BrnCardTitleConfig(
      titleTextStyle: BrnTextStyle.withStyle(
          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)));

  static initTheme() {
    BrnInitializer.register(
        allThemeConfig: BrnAllThemeConfig(
            commonConfig: commonConfig, cardTitleConfig: cardTitleConfig));
  }
}
