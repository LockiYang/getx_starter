import 'package:flutter/material.dart';
import 'package:getx_test/app/common/styles/zstyle_constants.dart';

import '../../utils/multi_click_util.dart';

const Color _backgroundColor = ZStyleConstans.brandPrimary;
const Color _disableBackgroundColor = Color(0xFFCCCCCC);
const TextStyle _textStyle =
    TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600);
const TextStyle _outlineTextStyle =
    TextStyle(fontSize: 16, color: _backgroundColor);
const double _radius = 4;
const EdgeInsetsGeometry _insertPadding =
    EdgeInsets.symmetric(horizontal: 20, vertical: 10);

/// 通用按钮
/// [isEnable]如果设置为false，那么按钮呈现灰色态，点击事件不响应
///
/// [child]默认使用[Text]文本组件，如果用户想要显示其他组件。比如图片等，可以设置[child]属性
///
/// 布局规则参考[Container]的布局规则
/// [alignment]的属性默认为null，组件尽可能的小。即使父布局给的约束是无边界(最大宽度或者最大高度是double.infinity)，组件的尺寸也会和child一样大。
/// [alignment]属性设置值，组件宽度充满父布局。
/// [constraints]属性设置了值，那么就会按着[constraints]布局。
///
/// constraints: BoxConstraints.expand(height: 60)
///
class BasicButtom extends StatelessWidget {
  /// 按钮是否可用 默认是true
  final bool isEnable;

  /// 按钮点击的回调
  final VoidCallback? onTap;

  /// 按钮显示的文案
  final String text;

  /// 按钮的文本显示样式
  final TextStyle textStyle;

  /// 按钮背景色 - 按钮颜色
  final Color backgroundColor;

  /// 按钮不可用的文字颜色
  final Color? disableTextColor;

  /// 按钮不可用背景色
  final Color disableBackgroundColor;

  /// 按钮内边距
  final EdgeInsetsGeometry insertPadding;

  /// 按钮的修饰 默认实色背景
  final Decoration? decoration;

  /// 按钮的显示子节点 优先级高于[text]
  final Widget? child;

  /// 按钮的布局约束 默认是自适应大小
  final BoxConstraints constraints;

  /// 按钮的内部对齐 默认为null
  final Alignment? alignment;

  /// 按钮圆角大小
  final BorderRadiusGeometry borderRadius;

  BasicButtom({
    Key? key,
    this.isEnable = true,
    this.onTap,
    required this.text,
    this.textStyle = _textStyle,
    this.backgroundColor = _backgroundColor,
    this.insertPadding = _insertPadding,
    this.child,
    this.disableTextColor,
    this.disableBackgroundColor = _disableBackgroundColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(_radius)),
    this.decoration,
    this.constraints = const BoxConstraints.tightFor(),
    this.alignment,
  }) : super(key: key);

  BasicButtom.outline({
    Key? key,
    Color? disableLineColor,
    Color? lineColor,
    double radius = 6,
    double borderWith = 1.0,
    this.isEnable = true,
    this.onTap,
    required this.text,
    this.textStyle = _outlineTextStyle,
    this.insertPadding = _insertPadding,
    this.child,
    this.disableTextColor = _disableBackgroundColor,
    this.disableBackgroundColor = _disableBackgroundColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(_radius)),
    this.constraints = const BoxConstraints.tightFor(),
    this.alignment,
  })  : backgroundColor = textStyle.color!,  decoration = _OutlineBoxDecorationCreator.createOutlineBoxDecoration(
            isEnable: isEnable,
            disableBackgroundColor: disableBackgroundColor,
            backgroundColor: textStyle.color!,
            borderWith: borderWith,
            borderRadius: borderRadius),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (MultiClickUtil.isMultiClick()) {
          return;
        }
        if (isEnable && onTap != null) {
          onTap!();
        }
      },
      child: Container(
        alignment: alignment,
        decoration: decoration ?? _getBoxDecoration(),
        constraints: constraints,
        padding: insertPadding,
        child: child ??
            Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: _getTextStyle(),
            ),
      ),
    );
  }

  TextStyle _getTextStyle() {
    if (isEnable) {
      return textStyle;
    } else {
      var textColor = disableTextColor ?? textStyle.color!.withOpacity(0.7);
      return TextStyle(
        fontSize: textStyle.fontSize,
        color: textColor,
        fontWeight: textStyle.fontWeight,
      );
    }
  }

  BoxDecoration _getBoxDecoration() {
    var bgColor = isEnable ? backgroundColor : disableBackgroundColor;
    return BoxDecoration(
      color: bgColor,
      borderRadius: borderRadius,
    );
  }
}

class _OutlineBoxDecorationCreator {
  static BoxDecoration createOutlineBoxDecoration(
      {required bool isEnable,
      required Color backgroundColor,
      required Color disableBackgroundColor,
      double borderWith = 1.0,
      BorderRadiusGeometry? borderRadius}) {
    Color _lineColor = isEnable ? backgroundColor : disableBackgroundColor;

    return BoxDecoration(
        border: Border.all(color: _lineColor, width: borderWith),
        borderRadius: borderRadius);
  }
}
