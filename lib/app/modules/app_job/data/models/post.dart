import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  Post();

  late String address;
  late num ageReqLower;
  late num ageReqUpper;
  late String alias;
  late String bgImg;
  late String bgVedio;
  late String contactName;
  late num defaultContactType;
  late num eachSubscribeCostScore;
  late num eduReq;
  late bool enterprise;
  late String enterpriseName;
  late String enterpriseNo;
  late num heightReqLower;
  late num heightReqUpper;
  late String industry;
  late String logo;
  late String miniWechat;
  late String mobile;
  late num onlineSubscribeNum;
  late String onlineTime;
  late num onlineWeights;
  late num orders;
  late String personDescp;
  late String personLogo;
  late String personName;
  late String position;
  late String postDetail;
  late num postId;
  late String postListDetail;
  late num postType;
  late String qq;
  late num recruitNum;
  late num recruitUserId;
  late String salary;
  late num settleType;
  late num sexReq;
  late num status;
  late num subscribeId;
  late num subScribeNum;
  late num subscribeNum;
  late num subscribeStatus;
  late String tags;
  late String tagsKc;
  late String tips;
  late String title;
  late String trainTips;
  late num userSubscribeNum;
  late String wechat;
  late String workAddress;
  late String workArea;
  late String workCity;
  late String workDate;
  late num workForm;
  late String workTime;
  
  factory Post.fromJson(Map<String,dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
