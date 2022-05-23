import 'package:flutter/material.dart';
import 'package:getx_test/app/common/widgets/button/basic_button.dart';

class ZbuttonSm extends StatelessWidget {
  const ZbuttonSm({
    Key? key,
    this.text = '',
    this.onTap,
    this.color = Colors.red
  }) : super(key: key);

  final String text;
  final VoidCallback? onTap;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return BasicButtom(
      onTap: onTap,
      text: text,
      textStyle: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w600),
      backgroundColor: color[50]!,
      insertPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      borderRadius: BorderRadius.circular(4),
    );
  }
}