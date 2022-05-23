import 'package:flutter/material.dart';

import '../over_scroll_behavior.dart';

/// 弹窗基类
class BaseDialog extends StatelessWidget {
  ///child
  final Widget child;

  ///圆角
  final double shape;

  ///左右边距
  final double horizontal;

  BaseDialog({
    Key? key,
    this.shape = 10,
    this.horizontal = 25,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        // 透明样式
        type: MaterialType.transparency,
        child: Center(
            // 取消ListView滑动阴影
            child: ScrollConfiguration(
                behavior: OverScrollBehavior(),
                child: ListView(shrinkWrap: true, children: [
                  ///背景及内容、边距、圆角等，必须包裹在ListView中
                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: EdgeInsets.only(top: 20),
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                      child: child)
                ]))));
  }
}
