import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  Article();

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
  late String title;
  late num type;
  late num userId;
  late num visible;
  late num zan;
  
  factory Article.fromJson(Map<String,dynamic> json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
