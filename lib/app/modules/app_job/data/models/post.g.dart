// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post()
  ..alias = json['alias'] as String
  ..bgImg = json['bgImg'] as String
  ..bgVedio = json['bgVedio'] as String
  ..bottomTips = json['bottomTips'] as String
  ..browseStatus = json['browseStatus'] as num
  ..industry = json['industry'] as String
  ..logo = json['logo'] as String
  ..postId = json['postId'] as num
  ..postType = json['postType'] as num
  ..salary = json['salary'] as String
  ..scribeCreateAt = json['scribeCreateAt'] as String
  ..scribeUpdateAt = json['scribeUpdateAt'] as String
  ..settleType = json['settleType'] as num
  ..subScribeNum = json['subScribeNum'] as num
  ..subscribeId = json['subscribeId'] as num
  ..subscribeStatus = json['subscribeStatus'] as num
  ..tags = json['tags'] as String
  ..tagsKc = json['tagsKc'] as String
  ..tips = json['tips'] as String
  ..title = json['title'] as String
  ..trainTips = json['trainTips'] as String
  ..workArea = json['workArea'] as String
  ..workCity = json['workCity'] as String;

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'alias': instance.alias,
      'bgImg': instance.bgImg,
      'bgVedio': instance.bgVedio,
      'bottomTips': instance.bottomTips,
      'browseStatus': instance.browseStatus,
      'industry': instance.industry,
      'logo': instance.logo,
      'postId': instance.postId,
      'postType': instance.postType,
      'salary': instance.salary,
      'scribeCreateAt': instance.scribeCreateAt,
      'scribeUpdateAt': instance.scribeUpdateAt,
      'settleType': instance.settleType,
      'subScribeNum': instance.subScribeNum,
      'subscribeId': instance.subscribeId,
      'subscribeStatus': instance.subscribeStatus,
      'tags': instance.tags,
      'tagsKc': instance.tagsKc,
      'tips': instance.tips,
      'title': instance.title,
      'trainTips': instance.trainTips,
      'workArea': instance.workArea,
      'workCity': instance.workCity,
    };
