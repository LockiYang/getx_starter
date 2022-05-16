import 'package:get/get.dart';

import '../widgets/dialog/loadding_dialog.dart';


/// 扩展Getx
extension GetExtension on GetInterface {
  /// 隐藏dialog
  dismiss() {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.back();
    }
  }

  /// 显示dialog
  showLoading({String text = '加载中'}) {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.back();
    }
    Get.dialog(LoadingDialog(text: text),
        transitionDuration: const Duration(milliseconds: 500),
        barrierDismissible: false);
  }
}
