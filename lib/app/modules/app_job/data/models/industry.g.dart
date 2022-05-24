// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'industry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Industry _$IndustryFromJson(Map<String, dynamic> json) => Industry()
  ..id = json['id'] as num
  ..createAt = json['createAt'] as String
  ..updateAt = json['updateAt'] as String
  ..name = json['name'] as String
  ..bg = json['bg'] as String
  ..orders = json['orders'] as num
  ..isActive = json['isActive'] as bool;

Map<String, dynamic> _$IndustryToJson(Industry instance) => <String, dynamic>{
      'id': instance.id,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
      'name': instance.name,
      'bg': instance.bg,
      'orders': instance.orders,
      'isActive': instance.isActive,
    };
