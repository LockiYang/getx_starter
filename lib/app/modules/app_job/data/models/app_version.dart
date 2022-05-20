import 'package:json_annotation/json_annotation.dart';

part 'app_version.g.dart';

@JsonSerializable()
class App_version {
  App_version();

  late String activeName;
  late String addWechatTips;
  late String androidMustLogin;
  late num browsePostGoldNumBonus;
  late String controlBonus;
  late String controlOne;
  late String homeBannerType;
  late bool isAdviceForce;
  late bool isForceUpdate;
  late bool isNeedUpdate;
  late bool isPost;
  late String kcName;
  late String loginDesc;
  late String loginTitle;
  late String messageChatContactButtonName;
  late String name;
  late String positionProgressButtonName;
  late String pxName;
  late String riskTips;
  late String subscribeButtonName;
  late num subscribeGoldNumBonus;
  late String topType;
  late String tryVideo;
  late String tutorialImg;
  late String updateAndroidSoftUrl;
  late String updateIosSoftUrl;
  late String updateVersion;
  late String uuid;
  
  factory App_version.fromJson(Map<String,dynamic> json) => _$App_versionFromJson(json);
  Map<String, dynamic> toJson() => _$App_versionToJson(this);
}
