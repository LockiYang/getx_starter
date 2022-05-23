import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/routes/app_pages.dart';

import '../news_user_service.dart';


/// 检查是否登录
class RouteAuthMiddleware extends GetMiddleware {
  // priority 数字小优先级高
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (NewsUserService.to.isLogin ||
        route == Routes.NEWS_SIGNIN ||
        route == Routes.NEWS_SIGNUP ||
        route == Routes.TEST_NEWS) {
      return null;
    } else {
      Future.delayed(
          Duration(seconds: 1), () => Get.snackbar("提示", "登录过期,请重新登录"));
      return RouteSettings(name: Routes.NEWS_SIGNIN);
    }
  }
}
