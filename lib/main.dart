import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/data/repositorys/wan_android_api.dart';
import 'package:getx_test/app/modules/app_job/data/repositorys/job_api.dart';
import 'package:getx_test/app/modules/app_job/services/config_service.dart';
import 'package:getx_test/app/modules/app_job/services/user_service.dart';
import 'package:getx_test/app/modules/test_wanandroid/data/eyepetizer_api.dart';
import 'package:getx_test/app/services/cache_service.dart';

import 'app/common/styles/app_theme.dart';
import 'app/common/utils/logger.dart';
import 'app/modules/test_news/service/news_config_service.dart';
import 'app/routes/app_pages.dart';

void main() {
  appInit();
}

void appInit() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// 屏幕方向设为竖直上，不能切换
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // setSystemUi();
  AppTheme.initTheme();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Get.putAsync<CacheService>(() => CacheService().init());
  await Get.putAsync<WanAndroidApi>(() => WanAndroidApi().init());
  await Get.putAsync<EyepetizerApi>(() => EyepetizerApi().init());
  Get.lazyPut<UserService>(() => UserService());
  await Get.putAsync<JobApi>(() => JobApi().init());
  await Get.putAsync<ConfigService>(() => ConfigService().init());
  
  Get.lazyPut<NewsConfigService>(() => NewsConfigService());
  FlutterNativeSplash.remove();
  runApp(const App());

  // RefreshConfiguration
}

void setSystemUi() {
  if (GetPlatform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // 状态栏颜色
      statusBarBrightness: Brightness.light, //
      statusBarIconBrightness: Brightness.dark, // 状态栏图标字体颜色
      systemNavigationBarDividerColor: Color.fromARGB(0, 42, 41, 41),
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  /// RefreshConfiguration(
  /// headerBuilder: () => ClassicHeader(),
  /// footerBuilder: () => ClassicFooter(),
  /// hideFooterWhenNotFull: true,
  /// headerTriggerDistance: 80,
  /// maxOverScrollExtent: 100,
  /// footerTriggerDistance: 150,
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, widget) => GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        navigatorObservers: [AppPages.observer],
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        enableLog: true,
        logWriterCallback: Logger.write,
      ),
    );
  }
}
