import 'package:flutter/material.dart';

const Color bgColor = Color(0xFFFEDCE0);
const Color textColor = Color(0xFF3D0007);
const Color btnColorStart = Color(0xFFF89500);
const Color btnColorEnd = Color(0xFFFA6B74);
const Color btnShadowColor = Color(0x33D83131);
const Color inputBorderColor = Color(0xFFECECEC);

// 按钮渐变背景色
const LinearGradient btnLinearGradient =
    LinearGradient(colors: [btnColorStart, btnColorEnd]);

// 按钮投影
const List<BoxShadow> btnShadow = [
  BoxShadow(
    color: btnShadowColor,
    offset: Offset(0, 8),
    blurRadius: 20,
  )
];
