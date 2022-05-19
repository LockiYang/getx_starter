import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  Post();

  late String alias;
  late String bgImg;
  late String bgVedio;
  late String bottomTips;
  late num browseStatus;
  late String industry;
  late String logo;
  late num postId;
  late num postType;
  late String salary;
  late String scribeCreateAt;
  late String scribeUpdateAt;
  late num settleType;
  late num subScribeNum;
  late num subscribeId;
  late num subscribeStatus;
  late String tags;
  late String tagsKc;
  late String tips;
  late String title;
  late String trainTips;
  late String workArea;
  late String workCity;
  
  factory Post.fromJson(Map<String,dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
