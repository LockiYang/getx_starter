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

  /// 后台控制参数
  final _controlOne = 'online'.obs;
  final _subscribeButtonName = '免费报名'.obs; // 报名按钮
  final _topType = 'none'.obs;
  final _androidMustLogin = true.obs; // 安卓强制登录
  final _loginTitle = '立即登录，解锁高薪兼职'.obs;
  final _loginDesc = '未注册过的手机号将自动创建账号'.obs;

  bool get isAppRecommend => _isAppRecommend.value;
  String get controlOne => _controlOne.value;
  String get subscribeButtonName => _subscribeButtonName.value;
  String get topTyp => _topType.value;
  bool get androidMustLogin => _androidMustLogin.value;
  String get loginTitle => _loginTitle.value;
  String get loginDesc => _loginDesc.value;

  @override
  void onInit() {
    super.onInit();
    _isAppRecommend.value =
        CacheService.to.getBool(ConfigService.cacheKeyIsAppRecommend) ?? true;
  }

  Future<ConfigService> init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    appVersion = packageInfo.version;
    appBuildNumber = packageInfo.buildNumber;

    await JobApi.to.getAppConfig(
      appChannel,
      success: (data) {
        _subscribeButtonName.value = data.subscribeButtonName;
        _topType.value = data.topType;
        _androidMustLogin.value = 'true' == data.androidMustLogin;
        _loginTitle.value = data.loginTitle;
        _loginDesc.value = data.loginDesc;
      },
    );
    return this;
  }

  void setIsAppRecommend(bool isRecommend) {
    _isAppRecommend.value = isRecommend;
    CacheService.to.setBool(ConfigService.cacheKeyIsAppRecommend, isRecommend);
  }
}
