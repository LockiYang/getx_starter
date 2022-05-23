import 'package:get/get.dart';
import 'package:getx_test/app/modules/app_job/data/repositorys/job_api.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../services/cache_service.dart';

class ConfigService extends GetxService {
  static ConfigService get to => Get.find();

  /// cache key
  static const String cacheKeyUserProfile = 'user_profile';
  static const String cackeKeyUserToken = 'user_token';
  static const String cacheKeyDeviceFirstOpen = 'device_first_open';
  static const String cacheKeyIsAppRecommend = 'app_recommend';
  static const String cacheKeyuserBrowseHistory = 'user_browse_history';


  static const String appChannel = String.fromEnvironment('APP_CHANNEL');
  static String? appName;
  static String? appVersion;
  static String? appBuildNumber;

  final _isAppRecommend = true.obs;
  final _loginTitle = ''.obs;

  bool get isAppRecommend => _isAppRecommend.value;
  String get loginTitle => _loginTitle.value;

  Future<ConfigService> init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    appVersion = packageInfo.version;
    appBuildNumber = packageInfo.buildNumber;

    await JobApi.to.getAppConfig(
      appChannel,
      success: (data) {
        _loginTitle.value = data.loginTitle;
      },
    );
    return this;
  }

  @override
  void onInit() {
    super.onInit();
    _isAppRecommend.value =
        CacheService.to.getBool(ConfigService.cacheKeyIsAppRecommend) ?? true;
  }

  void setIsAppRecommend(bool isRecommend) {
    _isAppRecommend.value = isRecommend;
    CacheService.to.setBool(ConfigService.cacheKeyIsAppRecommend, isRecommend);
  }
}
