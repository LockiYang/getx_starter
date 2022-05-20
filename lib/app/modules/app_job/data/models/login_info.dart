import 'package:json_annotation/json_annotation.dart';

part 'login_info.g.dart';

@JsonSerializable()
class Login_info {
  Login_info();

  late num errcode;
  late bool isBan;
  late bool isFirst;
  late bool isNew;
  late String token;
  late num userId;
  late String username;
  
  factory Login_info.fromJson(Map<String,dynamic> json) => _$Login_infoFromJson(json);
  Map<String, dynamic> toJson() => _$Login_infoToJson(this);
}
