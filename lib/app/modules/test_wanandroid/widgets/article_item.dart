import 'package:flutter/material.dart';

import '../data/article.dart';


/// 文章列表
class ArticleItem extends StatelessWidget {
  ///列表数据
  final Article item;

  final int index;

  ArticleItem({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Stack(
            children: [
              Text(
                getPaddingText(item.title),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              Visibility(
                  visible: index <= 2,
                  child: Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                    child: const Text(
                      '荐',
                      style: TextStyle(
                          color: Colors.white, fontSize: 10, height: 1.1),
                    ),
                  ))
            ],
          ),
          Visibility(
            visible: item.desc.isNotEmpty,
            // child: Html(data: item.desc),
            child: Text(item.desc),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item.superChapterName,
                style: TextStyle(
                    color: Color(0xFFFE8C28), fontSize: 11, height: 1.1),
              ),
              const SizedBox(width: 10),
              const Text(
                '|',
                style: TextStyle(
                    color: Color(0xff9F9EA6), fontSize: 11, height: 1.1),
              ),
              const SizedBox(width: 10),
              Text(
                item.shareUser.isEmpty ? item.author : item.shareUser,
                style: TextStyle(
                    color: Color(0xff9F9EA6), fontSize: 11, height: 1.1),
              ),
              const SizedBox(width: 10),
              Text(item.niceDate,
                  style: TextStyle(
                      color: Color(0xff9F9EA6), fontSize: 11, height: 1.1)),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            height: 0.5,
            thickness: 0.5,
            color: Color(0x66E0E6FD),
          )
        ],
      ),
    );
  }

  /// 获取第一行内部边距的Text
  ///[title] 标题
  String getPaddingText(String title) {
    return index <= 2 ? "     $title" : title;
  }
}
