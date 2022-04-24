import 'package:flutter/material.dart';

/// 菜单项目
class MenuItemWidget extends StatelessWidget {
  final IconData? icon;
  final IconData? endIcon;
  final String? title;
  final double? iconSize;
  final double? endIconSize;
  final Color? iconColor;
  final Color? endIconColor;
  final GestureTapCallback? onTap;

  MenuItemWidget(
      {Key? key,
      this.title = '',
      this.icon,
      this.endIcon = Icons.arrow_forward_ios,
      this.iconSize = 24,
      this.endIconSize = 16,
      this.iconColor = Colors.black,
      this.endIconColor = Colors.black,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 16),
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Positioned(
                child: Icon(
              icon,
              size: iconSize,
              color: iconColor,
            )),
            Positioned(left: 36, child: Text(title!)),
            Positioned(
                right: 16,
                child: Icon(
                  endIcon,
                  size: endIconSize,
                  color: endIconColor,
                ))
          ],
        ),
      ),
    );
  }
}
