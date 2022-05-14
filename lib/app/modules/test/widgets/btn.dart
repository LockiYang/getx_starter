import 'package:flutter/material.dart';
import 'package:getx_test/app/modules/test/common/size.dart';

import '../common/color.dart';

class GradientBtnWidget extends StatelessWidget {
  const GradientBtnWidget({Key? key, this.width, this.child, this.onTap})
      : super(key: key);
  final double? width;
  final Widget? child;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: 48,
        decoration: BoxDecoration(
            gradient: btnLinearGradient,
            boxShadow: btnShadow,
            borderRadius: BorderRadius.circular(btnRadius)),
        child: child,
      ),
    );
  }
}
