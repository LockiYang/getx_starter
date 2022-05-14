import 'package:flutter/material.dart';
import 'package:getx_test/app/modules/test/common/size.dart';

import 'color.dart';

// 按钮投影
const List<BoxShadow> btnBoxShadow = [
  BoxShadow(color: btnShadowColor, offset: Offset(0, 8), blurRadius: 20)
];

// 按钮文字样式
const TextStyle btnTextStyle = TextStyle(
    color: btnColorStart, fontSize: btnTextSize, fontWeight: mediumFontWeight);

// 标题文字样式
const TextStyle titleTextStyle = TextStyle(
    fontSize: titleTextSize, color: textColor, fontWeight: mediumFontWeight);

// 内容文字样式
const TextStyle bodyTextStyle = TextStyle(
    fontSize: bodyTextSize, color: textColor, fontWeight: lightFontWeight);

// 输入框边框
OutlineInputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: inputBorderColor, width: 1));
