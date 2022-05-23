import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/modules/app_job/data/repositorys/job_api.dart';

import '../../../../common/utils/toast_util.dart';

class JobFeedbackController extends GetxController {
  String issue = '';
  String contact = '';

  @override
  void onClose() {}

  ///由于没有反馈接口，因此延时2秒进行操作
  requestFeedback() {
    debugPrint("feedback >> issue == $issue");
    debugPrint("feedback >> contact == $contact");
    if (issue.isEmpty) {
      ToastUtil.show('请填写反馈内容');
      return;
    }
    String content = issue + '【' + contact + '】';
    JobApi.to.saveSuggest(
      content,
      success: (data) {
        ToastUtil.show('反馈成功');
        Get.back();
      },
    );
  }
}
