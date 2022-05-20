import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable()
class Pagination {
  Pagination();

  late num pageNum;
  late num pageSize;
  late num pages;
  late num size;
  late num total;
  
  factory Pagination.fromJson(Map<String,dynamic> json) => _$PaginationFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
