// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) => Banner()
  ..appType = json['appType'] as String
  ..bannerName = json['bannerName'] as String
  ..bannerTarget = json['bannerTarget'] as String
  ..bannerType = json['bannerType'] as num
  ..bgColor = json['bgColor'] as String
  ..createAt = json['createAt'] as String
  ..id = json['id'] as num
  ..imageUrl = json['imageUrl'] as String
  ..imageUrlAddress = json['imageUrlAddress'] as String
  ..orders = json['orders'] as num
  ..position = json['position'] as String
  ..status = json['status'] as bool
  ..updateAt = json['updateAt'] as String;

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'appType': instance.appType,
      'bannerName': instance.bannerName,
      'bannerTarget': instance.bannerTarget,
      'bannerType': instance.bannerType,
      'bgColor': instance.bgColor,
      'createAt': instance.createAt,
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'imageUrlAddress': instance.imageUrlAddress,
      'orders': instance.orders,
      'position': instance.position,
      'status': instance.status,
      'updateAt': instance.updateAt,
    };
