// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination()
  ..pageNum = json['pageNum'] as num
  ..pageSize = json['pageSize'] as num
  ..pages = json['pages'] as num
  ..size = json['size'] as num
  ..total = json['total'] as num;

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'pageNum': instance.pageNum,
      'pageSize': instance.pageSize,
      'pages': instance.pages,
      'size': instance.size,
      'total': instance.total,
    };
