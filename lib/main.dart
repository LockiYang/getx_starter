import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/global_service.dart';
import 'package:getx_test/app/services/storage_service.dart';

import 'app/routes/app_pages.dart';
import 'app/styles/app_theme.dart';

void main() {
  appInit();
}

void appInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<StorageService>(() => StorageService().init());
  Get.put<GlobalService>(GlobalService());
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
