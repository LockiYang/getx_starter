import 'package:getx_test/app/modules/app_job/data/models/index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class User_info {
  User_info();

  late num admittedNum;
  late String alias;
  late String birth;
  late String extraInfo;
  late bool finishResume;
  late num goldNum;
  late String header;
  late String mobile;
  late num overNum;
  late num profession;
  late String qq;
  late num registerdNum;
  late num sex;
  late num subscribeSum;
  late String topButtonName;
  late num topDefaultContactType;
  late String topDetail;
  late num topPostId;
  late num topPostType;
  late String topTitle;
  late String topVideo;
  late num userId;
  late String wechat;
  late List<Login_info> loginInfos;
  
  factory User_info.fromJson(Map<String,dynamic> json) => _$User_infoFromJson(json);
  Map<String, dynamic> toJson() => _$User_infoToJson(this);
}
