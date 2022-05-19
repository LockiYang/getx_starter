// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post_list _$Post_listFromJson(Map<String, dynamic> json) => Post_list()
  ..appType = json['appType'] as String
  ..bg = json['bg'] as String
  ..createAt = json['createAt'] as String
  ..icon = json['icon'] as String
  ..id = json['id'] as num
  ..name = json['name'] as String
  ..orders = json['orders'] as num
  ..status = json['status'] as bool
  ..title = json['title'] as String
  ..titleDesc = json['titleDesc'] as String
  ..type = json['type'] as num
  ..updateAt = json['updateAt'] as String;

Map<String, dynamic> _$Post_listToJson(Post_list instance) => <String, dynamic>{
      'appType': instance.appType,
      'bg': instance.bg,
      'createAt': instance.createAt,
      'icon': instance.icon,
      'id': instance.id,
      'name': instance.name,
      'orders': instance.orders,
      'status': instance.status,
      'title': instance.title,
      'titleDesc': instance.titleDesc,
      'type': instance.type,
      'updateAt': instance.updateAt,
    };
