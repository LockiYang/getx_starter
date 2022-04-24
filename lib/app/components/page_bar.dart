import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/styles/app_theme.dart';

/// 页面标题栏
class PageBarWidget extends StatelessWidget {
  final String? title;
  final String? endTitle;
  final bool? isShowEnd;
  final Color? backgroundColor;
  final Color? backColor;
  final VoidCallback? backOnTap;

  const PageBarWidget(
      {Key? key,
      this.title = '',
      this.endTitle = '',
      this.isShowEnd = false,
      this.backgroundColor = Colors.white,
      this.backColor = appColorDark,
      this.backOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: SafeArea(
        child: Container(
          height: 56,
          child: Stack(children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16),
              child: GestureDetector(
                onTap: backOnTap ?? () => Get.back(),
                child: Container(
                  child: Icon(
                    Icons.arrow_back,
                    color: backColor,
                    size: 20,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                title!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 16),
              child: Text(
                endTitle!,
                style: TextStyle(color: appColorDark),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
