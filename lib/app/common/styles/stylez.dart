import 'package:flutter/material.dart';

import 'theme_constants.dart';

class Stylez {
  /// 超大标题
  static const TextStyle textBebas = TextStyle(
      fontSize: ThemeConstants.fontSizeBebas,
      fontWeight: FontWeight.bold,
      color: ThemeConstants.brandPrimary);

  /// 大标题
  /// 名称/页面大标题
  static const TextStyle textHeadLg = TextStyle(
      fontSize: ThemeConstants.fontSizeHeadLg,
      fontWeight: FontWeight.bold,
      color: ThemeConstants.colorTextBase);

  /// 主标题
  /// 内容模块标题/一级标题
  static const TextStyle textHead = TextStyle(
      fontSize: ThemeConstants.fontSizeHead,
      fontWeight: FontWeight.w600,
      color: ThemeConstants.colorTextBase);

  /// 副标题
  /// 标题/录入文字/大按钮文字/二级标题
  static const TextStyle textSubHead = TextStyle(
      fontSize: ThemeConstants.fontSizeSubHead,
      fontWeight: FontWeight.w600,
      color: ThemeConstants.colorTextBase);

  /// 基础字号
  /// 内容副文本/普通说明文字
  static const TextStyle textBase = TextStyle(
      fontSize: ThemeConstants.fontSizeBase,
      fontWeight: FontWeight.normal,
      color: ThemeConstants.colorTextBase);

  /// 辅助字号
  static const TextStyle textCaption = TextStyle(
      fontSize: ThemeConstants.fontSizeCaption,
      fontWeight: FontWeight.normal,
      color: ThemeConstants.colorTextSecondary);

  /// 辅助字号-小
  static const TextStyle textCaptionSm = TextStyle(
      fontSize: ThemeConstants.fontSizeCaptionSm,
      fontWeight: FontWeight.normal,
      color: ThemeConstants.colorTextSecondary);
}

/// 间隔
class Spacez {
  /// 水平间隔
  static Widget hSpacezXs = const SizedBox(width: ThemeConstants.hSpacingXs);
  static Widget hSpacezSm = const SizedBox(width: ThemeConstants.hSpacingSm);
  static Widget hSpacezMd = const SizedBox(width: ThemeConstants.hSpacingMd);
  static Widget hSpacezLg = const SizedBox(width: ThemeConstants.hSpacingLg);
  static Widget hSpacezXl = const SizedBox(width: ThemeConstants.hSpacingXl);
  static Widget hSpacezXxl = const SizedBox(width: ThemeConstants.hSpacingXxl);

  /// 垂直间隔
  static Widget vSpacezXs = const SizedBox(height: ThemeConstants.hSpacingXs);
  static Widget vSpacezSm = const SizedBox(height: ThemeConstants.hSpacingSm);
  static Widget vSpacezMd = const SizedBox(height: ThemeConstants.hSpacingMd);
  static Widget vSpacezLg = const SizedBox(height: ThemeConstants.hSpacingLg);
  static Widget vSpacezXl = const SizedBox(height: ThemeConstants.hSpacingXl);
  static Widget vSpacezXxl = const SizedBox(height: ThemeConstants.hSpacingXxl);

  static Widget getHSpacez(double width) {
    return SizedBox(width: width);
  }

  static Widget getVSpacez(double height) {
    return SizedBox(height: height);
  }
}

class Dividerz {
  ///分割线 0.5 - 20边距
  static Widget divider1Pd20 = const Divider(
    height: 0.5,
    thickness: 0.5,
    indent: 20,
    endIndent: 20,
    color: ThemeConstants.borderColorBase,
  );

  ///分割线 0.5 - 无边距
  static Widget divider1 = const Divider(
    height: 0.5,
    thickness: 0.5,
    color: ThemeConstants.borderColorBase,
  );

  ///分割线 20 - 无边距
  static Widget divider20 = const Divider(
    height: 20,
    thickness: 20,
    color: ThemeConstants.borderColorBase,
  );
}
