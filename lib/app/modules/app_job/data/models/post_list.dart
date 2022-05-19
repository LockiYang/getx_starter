import 'package:json_annotation/json_annotation.dart';

part 'post_list.g.dart';

@JsonSerializable()
class Post_list {
  Post_list();

  late String appType;
  late String bg;
  late String createAt;
  late String icon;
  late num id;
  late String name;
  late num orders;
  late bool status;
  late String title;
  late String titleDesc;
  late num type;
  late String updateAt;
  
  factory Post_list.fromJson(Map<String,dynamic> json) => _$Post_listFromJson(json);
  Map<String, dynamic> toJson() => _$Post_listToJson(this);
}
