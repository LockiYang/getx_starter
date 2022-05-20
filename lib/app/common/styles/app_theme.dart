import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

import '../no_splash_factory.dart';
import 'lib_color_schemes.g.dart';
import 'zstyle_constants.dart';

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
      brandPrimary: ZStyleConstans.brandPrimary,
      brandPrimaryTap: ZStyleConstans.brandPrimaryTap,
      brandSuccess: ZStyleConstans.brandSuccess,
      brandWarning: ZStyleConstans.brandWarning,
      brandError: ZStyleConstans.brandError,
      brandImportant: ZStyleConstans.brandImportant,
      brandImportantValue: ZStyleConstans.brandImportantValue,
      brandAuxiliary: ZStyleConstans.brandAuxiliary,
      colorTextBase: ZStyleConstans.colorTextBase,
      colorTextImportant: ZStyleConstans.colorTextImportant,
      colorTextBaseInverse: ZStyleConstans.colorTextBaseInverse,
      colorTextSecondary: ZStyleConstans.colorTextSecondary,
      colorTextDisabled: ZStyleConstans.colorTextDisabled,
      colorTextHint: ZStyleConstans.colorTextHint,
      colorLink: ZStyleConstans.colorLink,
      fillBase: ZStyleConstans.fillBase,
      fillBody: ZStyleConstans.fillBody,
      fillMask: ZStyleConstans.fillMask,
      borderColorBase: ZStyleConstans.borderColorBase,
      dividerColorBase: ZStyleConstans.dividerColorBase,
      fontSizeBebas: ZStyleConstans.fontSizeBebas,
      fontSizeHeadLg: ZStyleConstans.fontSizeHeadLg,
      fontSizeHead: ZStyleConstans.fontSizeHead,
      fontSizeSubHead: ZStyleConstans.fontSizeSubHead,
      fontSizeBase: ZStyleConstans.fontSizeBase,
      fontSizeCaption: ZStyleConstans.fontSizeCaption,
      fontSizeCaptionSm: ZStyleConstans.fontSizeCaptionSm,
      radiusXs: ZStyleConstans.radiusXs,
      radiusSm: ZStyleConstans.radiusSm,
      radiusMd: ZStyleConstans.radiusMd,
      radiusLg: ZStyleConstans.radiusLg,
      borderWidthSm: ZStyleConstans.borderWidthSm,
      borderWidthMd: ZStyleConstans.borderWidthMd,
      borderWidthLg: ZStyleConstans.borderWidthLg,
      hSpacingXs: ZStyleConstans.hSpacingXs,
      hSpacingSm: ZStyleConstans.hSpacingSm,
      hSpacingMd: ZStyleConstans.hSpacingMd,
      hSpacingLg: ZStyleConstans.hSpacingLg,
      hSpacingXl: ZStyleConstans.hSpacingXl,
      hSpacingXxl: ZStyleConstans.hSpacingXxl,
      vSpacingXs: ZStyleConstans.vSpacingXs,
      vSpacingSm: ZStyleConstans.vSpacingSm,
      vSpacingMd: ZStyleConstans.vSpacingMd,
      vSpacingLg: ZStyleConstans.vSpacingLg,
      vSpacingXl: ZStyleConstans.vSpacingXl,
      vSpacingXxl: ZStyleConstans.vSpacingXxl,
      iconSizeXxs: ZStyleConstans.iconSizeXxs,
      iconSizeXs: ZStyleConstans.iconSizeXs,
      iconSizeSm: ZStyleConstans.iconSizeSm,
      iconSizeMd: ZStyleConstans.iconSizeMd,
      iconSizeLg: ZStyleConstans.iconSizeLg);

  static BrnCardTitleConfig cardTitleConfig = BrnCardTitleConfig(
      titleTextStyle: BrnTextStyle.withStyle(
          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
      cardTitlePadding: EdgeInsets.symmetric(vertical: 15));

  static initTheme() {
    BrnInitializer.register(
        allThemeConfig: BrnAllThemeConfig(
            commonConfig: commonConfig, cardTitleConfig: cardTitleConfig));
  }
}
