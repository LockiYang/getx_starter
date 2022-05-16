import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/data/repositorys/wan_android_api.dart';
import 'package:getx_test/app/modules/test_wanandroid/data/eyepetizer_api.dart';
import 'package:getx_test/app/services/cache_service.dart';

import 'app/common/styles/app_theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  appInit();
}

void appInit() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Get.putAsync<CacheService>(() => CacheService().init());
  
  await Get.putAsync<WanAndroidApi>(() => WanAndroidApi().init());
  await Get.putAsync<EyepetizerApi>(() => EyepetizerApi().init());
  AppTheme.initTheme();

  FlutterNativeSplash.remove();
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
