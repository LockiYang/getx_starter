import 'package:get/get.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_home/wa_main/wa_main_controller.dart';

class WamainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaMainController>(
      () => WaMainController(),
    );
  }
}
