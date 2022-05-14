import 'package:get/get.dart';

import '../widgets/loadding_dialog.dart';

///get 扩展方法
extension GetExtension on GetInterface {
  ///隐藏dialog
  dismiss() {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.back();
    }
  }

  ///显示dialog
  showLoading({String text = ''}) {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.back();
    }
    Get.dialog(LoadingDialog(text: text),
        transitionDuration: const Duration(milliseconds: 500),
        barrierDismissible: false);
  }
}
