// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login_info _$Login_infoFromJson(Map<String, dynamic> json) => Login_info()
  ..errcode = json['errcode'] as num
  ..isBan = json['isBan'] as bool
  ..isFirst = json['isFirst'] as bool
  ..isNew = json['isNew'] as bool
  ..token = json['token'] as String
  ..userId = json['userId'] as num
  ..username = json['username'] as String;

Map<String, dynamic> _$Login_infoToJson(Login_info instance) =>
    <String, dynamic>{
      'errcode': instance.errcode,
      'isBan': instance.isBan,
      'isFirst': instance.isFirst,
      'isNew': instance.isNew,
      'token': instance.token,
      'userId': instance.userId,
      'username': instance.username,
    };
