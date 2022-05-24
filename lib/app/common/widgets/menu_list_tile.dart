import 'package:flutter/material.dart';
import 'package:getx_test/app/common/styles/zstyle_constants.dart';

/// 菜单项目
class MenuListTile extends StatelessWidget {
  final IconData? icon;
  final Image? iconImg;
  final Color? iconColor;
  final double? iconSize;
  final String? title;
  final String? content;
  final IconData? endIcon;
  final double? endIconSize;
  final Color? endIconColor;
  final Widget? endWidget;
  final GestureTapCallback? onTap;

  MenuListTile(
      {Key? key,
      this.title,
      this.content,
      this.icon,
      this.iconImg,
      this.iconSize = 22,
      this.iconColor = ZStyleConstans.colorTextBase,
      this.endIcon = Icons.arrow_forward_ios,
      this.endIconSize = 16,
      this.endIconColor = ZStyleConstans.colorTextSecondary,
      this.endWidget,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    icon == null
                        ? Container()
                        : Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Icon(
                              icon,
                              size: iconSize,
                              color: iconColor,
                            ),
                          ),
                    iconImg == null
                        ? Container()
                        : Container(
                            margin: EdgeInsets.only(right: 10),
                            child: iconImg,
                          ),
                    title == null
                        ? Container()
                        : Text(
                            title!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ],
                ),
                Row(
                  children: [
                    content == null
                        ? Container()
                        : Text(
                            content!,
                            style: TextStyle(
                                color: ZStyleConstans.colorTextSecondary),
                          ),
                    endWidget != null
                        ? Container()
                        : Icon(
                            endIcon,
                            size: endIconSize,
                            color: endIconColor,
                          ),
                    endWidget == null ? Container() : endWidget!
                  ],
                )
              ],
            )),
      ),
    );
  }
}
