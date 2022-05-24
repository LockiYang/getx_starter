import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

class ProjectPage {
  ///当前页数
  int curPage = 0;

  ///数据
  List datas = [];

  ///偏移
  int offset = 0;

  ///是否为最后一页
  bool over = false;

  ///页数长度
  int pageCount = 0;

  ///当前页大小
  int size = 0;

  ///数据总大小
  int total = 0;

  ProjectPage({
    required this.curPage,
    required this.datas,
    required this.offset,
    required this.over,
    required this.pageCount,
    required this.size,
    required this.total,
  });

  ProjectPage.fromJson(Map<dynamic, dynamic> json) {
    curPage = json["curPage"];
    offset = json["offset"];
    over = json["over"];
    pageCount = json["pageCount"];
    size = json["size"];
    total = json["total"];
    datas = json['datas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["curPage"] = curPage;
    data["datas"] = datas;
    data["offset"] = offset;
    data["over"] = over;
    data["pageCount"] = pageCount;
    data["size"] = size;
    data["total"] = total;
    return data;
  }
}

@JsonSerializable()
class Project {
  Project();

  late String apkLink;
  late num audit;
  late String author;
  late bool canEdit;
  late num chapterId;
  late String chapterName;
  late bool collect;
  late num courseId;
  late String desc;
  late String descMd;
  late String envelopePic;
  late bool fresh;
  late String host;
  late num id;
  late String link;
  late String niceDate;
  late String niceShareDate;
  late String origin;
  late String prefix;
  late String projectLink;
  late num publishTime;
  late num realSuperChapterId;
  late num selfVisible;
  late num shareDate;
  late String shareUser;
  late num superChapterId;
  late String superChapterName;
  late List tags;
  late String title;
  late num type;
  late num userId;
  late num visible;
  late num zan;
  
  factory Project.fromJson(Map<String,dynamic> json) => _$ProjectFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
