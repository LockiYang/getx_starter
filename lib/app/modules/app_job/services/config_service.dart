import 'package:get/get.dart';
import 'package:getx_test/app/modules/app_job/data/repositorys/job_api.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../common/services/cache_service.dart';

class ConfigService extends GetxService {
  static ConfigService get to => Get.find();

  /// cache key
  static const String cacheKeyUserProfile = 'user_profile';
  static const String cackeKeyUserToken = 'user_token';
  static const String cacheKeyDeviceFirstOpen = 'device_first_open';
  static const String cacheKeyIsAppRecommend = 'app_recommend';
  static const String cacheKeyIsProtocalAgree = 'app_protocal_agree';
  static const String cacheKeyuserBrowseHistory = 'user_browse_history';

  static const String agreementUrl = 'https://h5.sd51ykt.com/protocol.html?p=1';
  static const String policyUrl = 'https://h5.sd51ykt.com/protocol.html?p=2';
  static const String askCenterUrl = 'https://h5.sd51ykt.com/ask-center.html';

  static const String appChannel = String.fromEnvironment('APP_CHANNEL');
  static String? appName;
  static String? appVersion;
  static String? appBuildNumber;

  final _isAppRecommend = true.obs;
  final _isProtocalAgree = false.obs;

  /// 后台控制参数
  final _controlOne = 'online'.obs;
  final _subscribeButtonName = ''.obs; // 报名按钮
  final _positionProgressButtonName = ''.obs;
  final _topType = 'none'.obs;
  final _androidMustLogin = true.obs; // 安卓强制登录
  final _loginTitle = '立即登录，解锁高薪兼职'.obs;
  final _loginDesc = '未注册过的手机号将自动创建账号'.obs;
  final _riskTips = ''.obs;

  bool get isAppRecommend => _isAppRecommend.value;
  bool get isProtocalAgree => _isProtocalAgree.value;
  String get controlOne => _controlOne.value;
  String get subscribeButtonName => _subscribeButtonName.value;
  String get positionProgressButtonName => _positionProgressButtonName.value;
  String get topTyp => _topType.value;
  bool get androidMustLogin => _androidMustLogin.value;
  String get loginTitle => _loginTitle.value;
  String get loginDesc => _loginDesc.value;
  String get riskTips => _riskTips.value;

  @override
  void onInit() {
    super.onInit();
    _isAppRecommend.value =
        CacheService.to.getBool(ConfigService.cacheKeyIsAppRecommend) ?? true;
    _isProtocalAgree.value =
        CacheService.to.getBool(ConfigService.cacheKeyIsProtocalAgree) ?? false;
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
        _positionProgressButtonName.value = data.positionProgressButtonName;
        _topType.value = data.topType;
        _androidMustLogin.value = 'true' == data.androidMustLogin;
        _loginTitle.value = data.loginTitle;
        _loginDesc.value = data.loginDesc;
        _riskTips.value = data.riskTips;
      },
    );
    return this;
  }

  void setIsAppRecommend(bool isRecommend) {
    _isAppRecommend.value = isRecommend;
    CacheService.to.setBool(ConfigService.cacheKeyIsAppRecommend, isRecommend);
  }

  void setIsProtocalAgree(bool isProtocalAgree) {
    _isProtocalAgree.value = isProtocalAgree;
    CacheService.to
        .setBool(ConfigService.cacheKeyIsProtocalAgree, isProtocalAgree);
  }
}
