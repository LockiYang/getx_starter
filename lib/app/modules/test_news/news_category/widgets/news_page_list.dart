import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/modules/test_news/news_category/news_category_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'news_item.dart';

class NewsPageList extends StatefulWidget {
  NewsPageList({Key? key}) : super(key: key);

  @override
  _NewsPageListState createState() => _NewsPageListState();
}

class _NewsPageListState extends State<NewsPageList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final controller = Get.find<NewsCategoryController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetX<NewsCategoryController>(
      init: controller,
      builder: (controller) => SmartRefresher(
        enablePullUp: true,
        controller: controller.refreshController,
        onRefresh: controller.onRefresh,
        onLoading: controller.onLoading,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 0.w,
                horizontal: 0.w,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (content, index) {
                    var item = controller.newsList[index];
                    return newsListItem(item);
                  },
                  childCount: controller.newsList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
