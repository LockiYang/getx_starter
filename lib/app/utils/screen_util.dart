import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenUtil {
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
}