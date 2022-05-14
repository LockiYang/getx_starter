import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/app_colors.dart';


class NewsIndexController extends GetxController {
  /// 响应式成员变量
  var page = 0.obs;

  /// 成员变量
  // tab 页标题
  late final List<String> tabTitles;

  // 页控制器
  late final PageController pageController;

  // 底部导航项目
  late final List<BottomNavigationBarItem> bottomTabs;

  /// 事件
  // tab栏动画
  void handleNavBarTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  // tab栏页码切换
  void handlePageChanged(int p) {
    page.value = p;
  }

  @override
  void onInit() {
    super.onInit();
    tabTitles = ['Welcome', 'Cagegory', 'Bookmarks', 'Account'];
    bottomTabs = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: AppColors.tabBarElement,
        ),
        activeIcon: Icon(
          Icons.home,
          color: AppColors.secondaryElementText,
        ),
        label: 'main',
        backgroundColor: AppColors.primaryBackground,
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.grid_4x4,
          color: AppColors.tabBarElement,
        ),
        activeIcon: Icon(
          Icons.grid_4x4,
          color: AppColors.secondaryElementText,
        ),
        label: 'category',
        backgroundColor: AppColors.primaryBackground,
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.tag,
          color: AppColors.tabBarElement,
        ),
        activeIcon: Icon(
          Icons.tag,
          color: AppColors.secondaryElementText,
        ),
        label: 'tag',
        backgroundColor: AppColors.primaryBackground,
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.people,
          color: AppColors.tabBarElement,
        ),
        activeIcon: Icon(
          Icons.people,
          color: AppColors.secondaryElementText,
        ),
        label: 'my',
        backgroundColor: AppColors.primaryBackground,
      ),
    ];
    pageController = PageController(initialPage: page.value);
  }


  @override
  void onClose() {}

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
