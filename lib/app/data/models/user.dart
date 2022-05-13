import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User();

  late bool admin;
  late List chapterTops;
  late num coinCount;
  late List collectIds;
  late String email;
  late String icon;
  late num id;
  late String nickname;
  late String password;
  late String publicName;
  late String token;
  late num type;
  late String username;
  
  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
