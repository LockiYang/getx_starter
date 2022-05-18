import 'package:flutter/material.dart';


/// 去掉下拉水波纹
class OverScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    if (getPlatform(context) == TargetPlatform.android ||
        getPlatform(context) == TargetPlatform.fuchsia) {
      return GlowingOverscrollIndicator(
        child: child,
        /// 不显示头部水波纹
        showLeading: false,
        /// 不显示尾部水波纹
        showTrailing: false,
        axisDirection: axisDirection,
        color: Theme.of(context).colorScheme.secondary,
      );
    } else {
      return child;
    }
  }
}
