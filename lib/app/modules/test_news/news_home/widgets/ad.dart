import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_test/app/modules/test_news/news_home/news_home_controller.dart';

import '../../common/app_colors.dart';

/// ad广告
class AdWidget extends GetView<NewsHomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100.w,
      padding: EdgeInsets.all(20.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(
            color: Color.fromARGB(255, 230, 230, 231),
            width: 1,
            style: BorderStyle.solid,
          )),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tired of Ads? Get Premium - \$9.99",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
                height: 18.sp / 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
