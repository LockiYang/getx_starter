import 'package:get/get.dart';
import 'package:getx_test/app/common/utils/dialog_util.dart';

import '../../../routes/app_pages.dart';
import '../widgets/protocal_widget.dart';

class JobSplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(milliseconds: 1000), () {
      DialogUtil.commonDialog(
          title: '用户协议及隐私政策',
          contentWidget: ProtocalContent(),
          backText: '不同意',
          nextText: '同意',
          nextTap: () => Get.offAllNamed(Routes.APP_JOB),
          backTap: () => Get.offAllNamed(Routes.JOB_BROWSER_MODE),
          isNotice: true);
    });
  }

  @override
  void onClose() {}
}
