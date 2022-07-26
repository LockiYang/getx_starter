import 'az_common.dart';

class CityModel extends ISuspensionBean {
  String name = "";
  String tagIndex = "";
  String? namePinyin;
  String tag = "";
  String cityCode = "";

  CityModel({
    required this.name,
    this.tagIndex = "",
    this.namePinyin,
    this.tag = "",
    this.cityCode = "",
  });

  CityModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() => {
        'name': name,
        'tagIndex': tagIndex,
        'namePinyin': namePinyin,
        'isShowSuspension': isShowSuspension,
        'cityCode': cityCode
      };

  String getSuspensionTag() => tagIndex;

  @override
  String toString() => "CityBean {" + " \"name\":\"" + name + "\"" + '}';
}
