import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/cache_service.dart';

/// App配置服务 - 全局响应
class NewsConfigService extends GetxService {
  static NewsConfigService get to => Get.find();

  /// 用户 - 配置信息
  static const String STORAGE_USER_PROFILE_KEY = 'user_profile';

  /// 用户 - 配置信息
  static const String STORAGE_USER_TOKEN_KEY = 'user_token';

  /// 设备是否第一次打开
  static const String STORAGE_DEVICE_FIRST_OPEN_KEY = 'device_first_open';

  /// 首页新闻cacheKey
  static const String STORAGE_INDEX_NEWS_CACHE_KEY = 'cache_index_news';

  /// 多语言
  static const String STORAGE_LANGUAGE_CODE = 'language_code';

  bool isFirstOpen = false;
  // PackageInfo? _platform;
  // String get version => _platform?.version ?? '-';
  bool get isRelease => bool.fromEnvironment("dart.vm.product");
  Locale locale = Locale('en', 'US');
  List<Locale> languages = [
    Locale('en', 'US'),
    Locale('zh', 'CN'),
  ];

  @override
  void onInit() {
    super.onInit();
    isFirstOpen =
        CacheService.to.getBool(STORAGE_DEVICE_FIRST_OPEN_KEY) ?? false;
  }

  // Future<void> getPlatform() async {
  //   _platform = await PackageInfo.fromPlatform();
  // }

  // 标记用户已打开APP
  Future<bool> saveAlreadyOpen() {
    return CacheService.to.setBool(STORAGE_DEVICE_FIRST_OPEN_KEY, false);
  }

  void onInitLocale() {
    var langCode = CacheService.to.getString(STORAGE_LANGUAGE_CODE) ?? '';
    if (langCode.isEmpty) return;
    var index = languages.indexWhere((element) {
      return element.languageCode == langCode;
    });
    if (index < 0) return;
    locale = languages[index];
  }

  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(value);
    CacheService.to.setString(STORAGE_LANGUAGE_CODE, value.languageCode);
  }
}
