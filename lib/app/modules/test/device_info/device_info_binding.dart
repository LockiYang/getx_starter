import 'package:get/get.dart';

import 'device_info_controller.dart';

class DeviceInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DeviceInfoController>(
      DeviceInfoController(),
    );
  }
}
