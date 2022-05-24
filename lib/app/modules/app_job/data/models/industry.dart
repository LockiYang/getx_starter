import 'package:json_annotation/json_annotation.dart';

part 'industry.g.dart';

@JsonSerializable()
class Industry {
  Industry();

  late num id;
  late String createAt;
  late String updateAt;
  late String name;
  late String bg;
  late num orders;
  late bool isActive;
  
  factory Industry.fromJson(Map<String,dynamic> json) => _$IndustryFromJson(json);
  Map<String, dynamic> toJson() => _$IndustryToJson(this);
}
