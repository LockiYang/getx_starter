import 'package:json_annotation/json_annotation.dart';

part 'tree.g.dart';

@JsonSerializable()
class Tree {
  Tree();

  late String author;
  late num courseId;
  late String cover;
  late String desc;
  late num id;
  late String lisense;
  late String lisenseLink;
  late String name;
  late num order;
  late num parentChapterId;
  late bool userControlSetTop;
  late num visible;
  
  factory Tree.fromJson(Map<String,dynamic> json) => _$TreeFromJson(json);
  Map<String, dynamic> toJson() => _$TreeToJson(this);
}
