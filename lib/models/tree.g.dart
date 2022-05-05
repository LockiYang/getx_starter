// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tree _$TreeFromJson(Map<String, dynamic> json) => Tree()
  ..author = json['author'] as String
  ..courseId = json['courseId'] as num
  ..cover = json['cover'] as String
  ..desc = json['desc'] as String
  ..id = json['id'] as num
  ..lisense = json['lisense'] as String
  ..lisenseLink = json['lisenseLink'] as String
  ..name = json['name'] as String
  ..order = json['order'] as num
  ..parentChapterId = json['parentChapterId'] as num
  ..userControlSetTop = json['userControlSetTop'] as bool
  ..visible = json['visible'] as num;

Map<String, dynamic> _$TreeToJson(Tree instance) => <String, dynamic>{
      'author': instance.author,
      'courseId': instance.courseId,
      'cover': instance.cover,
      'desc': instance.desc,
      'id': instance.id,
      'lisense': instance.lisense,
      'lisenseLink': instance.lisenseLink,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };
