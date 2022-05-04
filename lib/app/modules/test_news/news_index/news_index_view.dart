import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/modules/test_news/news_category/news_category_view.dart';
import 'package:getx_test/app/modules/test_news/news_home/news_home_view.dart';

import '../../../styles/app_colors.dart';
import '../widgets/appbar.dart';
import 'news_index_controller.dart';

class NewsIndexView extends GetView<NewsIndexController> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812));
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // 顶部导航
  AppBar _buildAppBar() {
    return transparentAppBar(
        title: Obx(() => Text(
              controller.tabTitles[controller.page.value],
              style: TextStyle(
                color: AppColors.primaryText,
                // fontFamily: 'Montserrat',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            )),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: AppColors.primaryText,
            ),
            onPressed: () {},
          )
        ]);
  }

  // 内容页
  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        NewsHomeView(),
        NewsCategoryView(),
        Center(child: Text('BookmarksPage'),),
        Center(child: Text('AccountPage'),),
      ],
      controller: controller.pageController,
      onPageChanged: controller.handlePageChanged,
    );
  }

  // 底部导航
  Widget _buildBottomNavigationBar() {
    return Obx(() => BottomNavigationBar(
          items: controller.bottomTabs,
          currentIndex: controller.page.value,
          // fixedColor: AppColors.primaryElement,
          type: BottomNavigationBarType.fixed,
          onTap: controller.handleNavBarTap,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ));
  }
}
