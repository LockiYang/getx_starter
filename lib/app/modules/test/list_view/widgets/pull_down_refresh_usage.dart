import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mock_data.dart';
import 'news_card.dart';

class PullDownRefreshList extends StatefulWidget {
  const PullDownRefreshList({Key? key}) : super(key: key);

  @override
  _PullDownRefreshListState createState() => _PullDownRefreshListState();
}

class _PullDownRefreshListState extends State<PullDownRefreshList> {
  List list = newsList;

  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      Get.snackbar('通知', '当前已是最新数据');
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return NewsCard(data: list[index]);
        },
        separatorBuilder: (context, index) {
          return Divider(height: .5, color: Color(0xFFDDDDDD));
        },
      ),
    );
  }
}
