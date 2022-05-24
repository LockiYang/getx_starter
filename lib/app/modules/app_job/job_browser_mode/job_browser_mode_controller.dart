import 'package:get/get.dart';
import 'package:getx_test/app/modules/app_job/data/repositorys/job_api.dart';

import '../../../common/utils/dialog_util.dart';
import '../../../routes/app_pages.dart';
import '../data/models/post.dart';
import '../widgets/protocal_widget.dart';

class JobBrowserModeController extends GetxController {
  List<Post> posts = [];

  @override
  void onInit() {
    super.onInit();
    JobApi.to.getPostPage(28, 1, success: (data, page) {
      posts = data;
      update();
    });
  }

  @override
  void onClose() {}

  tapItem() {
    DialogUtil.commonDialog(
        title: '用户协议及隐私政策',
        contentWidget: ProtocalContent(),
        backText: '不同意',
        nextText: '同意',
        nextTap: () => Get.offAllNamed(Routes.APP_JOB),
        isNotice: true);
  }
}
