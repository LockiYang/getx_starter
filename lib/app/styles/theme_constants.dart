import 'package:flutter/material.dart';

class ThemeConstants {
  /// 主题色相关
  ///
  /// 主题色
  static Color brandPrimary = Color(0xFF0984F9);

  /// 主题色按下效果
  static Color brandPrimaryTap = Color(0x190984F9);

  /// 成功色
  static Color brandSuccess = Color(0xFF00AE66);

  /// 警告色
  static Color brandWarning = Color(0xFFFAAD14);

  /// 失败色
  static Color brandError = Color(0xFFFA3F3F);

  /// 重要-多用于红点色
  static Color brandImportant = Color(0xFFFA3F3F);

  /// 重要数值色
  static Color brandImportantValue = Color(0xFFFF5722);

  /// 辅助色
  static Color brandAuxiliary = Color(0xFF44C2FF);

  /// 文本色相关
  ///
  /// 基础文字纯黑色
  static Color colorTextBase = Color(0xFF222222);

  /// 基础文字重要色
  static Color colorTextImportant = Color(0xFF666666);

  /// 基础文字-反色
  static Color colorTextBaseInverse = Color(0xFFFFFFFF);

  /// 辅助文字色
  static Color colorTextSecondary = Color(0xFF999999);

  /// 失效或不可更改文字色
  static Color colorTextDisabled = Color(0xFF999999);

  /// 文本框提示暗文文字色
  static Color colorTextHint = Color(0xFFCCCCCC);

  /// 跟随主题色[brandPrimary]
  static Color colorLink = Color(0xFF0984F9);

  /// 背景色相关
  ///
  /// 组件背景色
  static Color fillBase = Color(0xFFFFFFFF);

  /// 页面背景色
  static Color fillBody = Color(0xFFF8F8F8);

  /// 遮罩背景
  static Color fillMask = Color(0x99000000);

  /// 边框色
  static Color borderColorBase = Color(0xFFF0F0F0);

  /// 分割线色
  static Color dividerColorBase = Color(0xFFF0F0F0);

  /// 文本字号
  ///
  /// 特殊数据展示，Bebas 数字字体，用于强吸引
  static double fontSizeBebas = 28.0;

  /// 标题字体
  /// 名称/页面大标题
  static double fontSizeHeadLg = 22.0;

  /// 标题字体
  /// 内容模块标题/一级标题
  static double fontSizeHead = 18.0;

  /// 子标题字体
  /// 标题/录入文字/大按钮文字/二级标题
  static double fontSizeSubHead = 16.0;

  /// 基础字体
  /// 内容副文本/普通说明文字
  static double fontSizeBase = 14.0;

  /// 辅助字体-普通
  static double fontSizeCaption = 12.0;

  ///辅助字体-小
  static double fontSizeCaptionSm = 11.0;

  /// 圆角尺寸
  static double radiusXs = 2.0;
  static double radiusSm = 4.0;
  static double radiusMd = 6.0;
  static double radiusLg = 8.0;

  /// 边框尺寸
  static double borderWidthSm = 0.5;
  static double borderWidthMd = 1.0;
  static double borderWidthLg = 2.0;

  /// 水平间距
  static double hSpacingXs = 8.0;
  static double hSpacingSm = 12.0;
  static double hSpacingMd = 16.0;
  static double hSpacingLg = 20.0;
  static double hSpacingXl = 24.0;
  static double hSpacingXxl = 42.0;

  /// 垂直间距
  static double vSpacingXs = 4.0;
  static double vSpacingSm = 8.0;
  static double vSpacingMd = 12.0;
  static double vSpacingLg = 14.0;
  static double vSpacingXl = 16.0;
  static double vSpacingXxl = 28.0;

  /// 图标大小
  static double iconSizeXxs = 8.0;
  static double iconSizeXs = 12.0;
  static double iconSizeSm = 14.0;
  static double iconSizeMd = 16.0;
  static double iconSizeLg = 32.0;
}
