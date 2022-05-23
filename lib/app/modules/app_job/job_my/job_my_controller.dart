import 'package:get/get.dart';
import 'package:getx_test/app/modules/app_job/data/repositorys/job_api.dart';

class JobMyController extends GetxController {
  int collectNum = 0;
  @override
  void onInit() {
    super.onInit();
    JobApi.to.getCollectnum(success: (data) {
      collectNum = data;
      update();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
