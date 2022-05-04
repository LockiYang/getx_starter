import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/routes/app_pages.dart';

import '../services/config_store.dart';
import '../services/user_store.dart';

/// 第一次欢迎页面
class RouteWelcomeMiddleware extends GetMiddleware {
  // priority 数字小优先级高
  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (ConfigStore.to.isFirstOpen == true) {
      return null;
    } else if (UserStore.to.isLogin == true) {
      return RouteSettings(name: Routes.NEWS_INDEX);
    } else {
      return RouteSettings(name: Routes.NEWS_SIGNIN);
    }
  }
}
