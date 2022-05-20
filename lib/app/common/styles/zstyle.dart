import 'package:flutter/material.dart';

import 'zstyle_constants.dart';

class ZStyle {
  /// 超大标题
  static const TextStyle textBebas = TextStyle(
      fontSize: ZStyleConstans.fontSizeBebas,
      fontWeight: FontWeight.bold,
      color: ZStyleConstans.brandPrimary);

  /// 大标题
  /// 名称/页面大标题
  static const TextStyle textHeadLg = TextStyle(
      fontSize: ZStyleConstans.fontSizeHeadLg,
      fontWeight: FontWeight.bold,
      color: ZStyleConstans.colorTextBase);

  /// 主标题
  /// 内容模块标题/一级标题
  static const TextStyle textHead = TextStyle(
      fontSize: ZStyleConstans.fontSizeHead,
      fontWeight: FontWeight.w600,
      color: ZStyleConstans.colorTextBase);

  /// 副标题
  /// 标题/录入文字/大按钮文字/二级标题
  static const TextStyle textSubHead = TextStyle(
      fontSize: ZStyleConstans.fontSizeSubHead,
      fontWeight: FontWeight.w600,
      color: ZStyleConstans.colorTextBase);

  /// 基础字号
  /// 内容副文本/普通说明文字
  static const TextStyle textBase = TextStyle(
      fontSize: ZStyleConstans.fontSizeBase,
      fontWeight: FontWeight.normal,
      color: ZStyleConstans.colorTextBase);

  /// 辅助字号
  static const TextStyle textCaption = TextStyle(
      fontSize: ZStyleConstans.fontSizeCaption,
      fontWeight: FontWeight.normal,
      color: ZStyleConstans.colorTextSecondary);

  /// 辅助字号-小
  static const TextStyle textCaptionSm = TextStyle(
      fontSize: ZStyleConstans.fontSizeCaptionSm,
      fontWeight: FontWeight.normal,
      color: ZStyleConstans.colorTextSecondary);
}

/// 间隔
class Spacez {
  /// 水平间隔
  static Widget hSpacezXs = const SizedBox(width: ZStyleConstans.hSpacingXs);
  static Widget hSpacezSm = const SizedBox(width: ZStyleConstans.hSpacingSm);
  static Widget hSpacezMd = const SizedBox(width: ZStyleConstans.hSpacingMd);
  static Widget hSpacezLg = const SizedBox(width: ZStyleConstans.hSpacingLg);
  static Widget hSpacezXl = const SizedBox(width: ZStyleConstans.hSpacingXl);
  static Widget hSpacezXxl = const SizedBox(width: ZStyleConstans.hSpacingXxl);

  /// 垂直间隔
  static Widget vSpacezXs = const SizedBox(height: ZStyleConstans.hSpacingXs);
  static Widget vSpacezSm = const SizedBox(height: ZStyleConstans.hSpacingSm);
  static Widget vSpacezMd = const SizedBox(height: ZStyleConstans.hSpacingMd);
  static Widget vSpacezLg = const SizedBox(height: ZStyleConstans.hSpacingLg);
  static Widget vSpacezXl = const SizedBox(height: ZStyleConstans.hSpacingXl);
  static Widget vSpacezXxl = const SizedBox(height: ZStyleConstans.hSpacingXxl);

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
    color: ZStyleConstans.borderColorBase,
  );

  ///分割线 0.5 - 无边距
  static Widget divider1 = const Divider(
    height: 0.5,
    thickness: 0.5,
    color: ZStyleConstans.borderColorBase,
  );

  ///分割线 20 - 无边距
  static Widget divider20 = const Divider(
    height: 20,
    thickness: 20,
    color: ZStyleConstans.borderColorBase,
  );
}
