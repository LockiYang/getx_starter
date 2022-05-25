import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UIUtil {
  /// 去除安卓状态栏半透明
  static removeStatusBarTransparent(BuildContext context) {
    // android 平台
    if (Theme.of(context).platform == TargetPlatform.android) {
      SystemUiOverlayStyle _style = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      );
      SystemChrome.setSystemUIOverlayStyle(_style);
    }
  }

  static defaultSystemUiOverlayStyle() {
    return SystemUiOverlayStyle(
      // 状态栏
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light, // for ios
      statusBarIconBrightness: Brightness.dark, // for android 状态栏图标字体颜色
      // 底部安全区
      systemNavigationBarDividerColor: Colors.white,
      systemNavigationBarColor: Colors.white, // for android
      systemNavigationBarIconBrightness: Brightness.light, // for android
    );
  }
}
