import 'package:get/get.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_project/wa_project_controller.dart';

class WaProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaProjectController>(
      () => WaProjectController(),
    );
  }
}
