import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/data/repositorys/wan_android_api.dart';
import 'package:getx_test/app/modules/test_wanandroid/data/eyepetizer_api.dart';
import 'package:getx_test/app/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/common/styles/app_theme.dart';
import 'app/common/utils/sp_util.dart';
import 'app/routes/app_pages.dart';
import 'app/services/video_history.dart';

void main() {
  appInit();
}

void appInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil().init();

  await Get.putAsync<HistoryService>(() => HistoryService().init());
  await Get.putAsync<StorageService>(() => StorageService().init());
  await Get.putAsync<WanAndroidApi>(() => WanAndroidApi().init());
  await Get.putAsync<EyepetizerApi>(() => EyepetizerApi().init());
  await Get.putAsync<SharedPreferences>(() => SharedPreferences.getInstance());
  AppTheme.initTheme();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
    );
  }
}
