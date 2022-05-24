import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/modules/app_job/services/user_service.dart';
import 'package:getx_test/app/routes/app_pages.dart';

/// 检查是否登录
class JobAuthMiddleware extends GetMiddleware {
  // priority 数字小优先级高

  JobAuthMiddleware({required priority}) : super(priority: priority);

  @override
  RouteSettings? redirect(String? route) {
    if (UserService.to.isLogin ||
        route == Routes.JOB_LOGIN ||
        route == Routes.JOB_HOME ||
        route == Routes.JOB_ABOUT_US) {
      return null;
    } else {
      return RouteSettings(name: Routes.JOB_LOGIN);
    }
  }
}
