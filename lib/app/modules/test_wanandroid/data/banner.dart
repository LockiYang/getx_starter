import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class Banner {
  Banner();

  late String desc;
  late num id;
  late String imagePath;
  late num isVisible;
  late num order;
  late String title;
  late num type;
  late String url;
  
  factory Banner.fromJson(Map<String,dynamic> json) => _$BannerFromJson(json);
  Map<String, dynamic> toJson() => _$BannerToJson(this);
}
