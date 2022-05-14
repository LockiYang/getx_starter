import 'package:get/get.dart';

import '../../../data/models/user.dart';
import '../../../utils/cache_util.dart';

class WaMyController extends GetxController {
  User? loginUser;
  
  @override
  void onInit() {
    super.onInit();
    var info = CacheUtil.getUserInfo();
    if (info != null) {
      loginUser = info;
      update();
    }
  }


  @override
  void onClose() {}
}
