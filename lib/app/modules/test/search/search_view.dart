import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'search_controller.dart';
import 'widgets/search_appbar.dart';

class SearchView extends GetView<SearchController> {
  GlobalKey keyLeading = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,  //清除title左右padding，默认情况下会有一定的padding距离
        toolbarHeight: 44, //将高度定到44，设计稿的高度。为了方便适配，
        //推荐使用插件flutter_screenutil做屏幕的适配工作
        backgroundColor: Colors.white,
        elevation: 0,
        //由于title本身是接受一个widget，所以可以直接给他一个自定义的widget。
        title: SearchAppBar(
          hintLabel: "电影/电视剧/影人",
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Center(
          child: Text('SearchView'),
        ),
      ),
    );
  }
}
