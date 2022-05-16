import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/dialog/common_dialog.dart';
import '../widgets/dialog/loadding_dialog.dart';

class DialogUtil {
  /// 隐藏dialog
  static dismiss() {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.back();
    }
  }

  /// 显示dialog
  static showLoading({String text = '加载中'}) {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.back();
    }
    Get.dialog(LoadingDialog(text: text),
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: false);
  }

  /// 标准弹窗
  static commonDialog(
      {String title = '',
      String content = '',
      String backText = '取消',
      String nextText = '确定',
      VoidCallback? backTap,
      VoidCallback? nextTap,
      bool backVisible = true,
      bool nextVisible = true}) {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.back();
    }
    Get.dialog(
        CommonDialog(
          title: title,
          content: content,
          backText: backText,
          nextText: nextText,
          backTap: backTap,
          nextTap: nextTap,
          backVisible: backVisible,
          nextVisible: nextVisible,
        ),
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: false);
  }
}
