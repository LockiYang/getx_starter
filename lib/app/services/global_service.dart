import 'package:get/get.dart';

import '../common/styles/app_theme.dart';

class GlobalService extends GetxService {
  
  static GlobalService get to => Get.find();

  final RxBool _isDarkMode = Get.isDarkMode.obs;
  bool get isDarkMode => _isDarkMode.value;

  void switchThemeMode() {
    _isDarkMode.value = !_isDarkMode.value;
    Get.changeTheme(_isDarkMode.value == true ? AppTheme.dark : AppTheme.dark);
  }
}
