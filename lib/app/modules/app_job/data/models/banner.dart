import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class Banner {
  Banner();

  late String appType;
  late String bannerName;
  late String bannerTarget;
  late num bannerType;
  late String bgColor;
  late String createAt;
  late num id;
  late String imageUrl;
  late String imageUrlAddress;
  late num orders;
  late String position;
  late bool status;
  late String updateAt;
  late List tag;
  
  factory Banner.fromJson(Map<String,dynamic> json) => _$BannerFromJson(json);
  Map<String, dynamic> toJson() => _$BannerToJson(this);
}
