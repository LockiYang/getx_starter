import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/common/styles/stylez.dart';
import 'package:getx_test/app/common/widgets/over_scroll_behavior.dart';
import 'package:getx_test/app/common/widgets/tabbar/kugou_tabbar.dart';
import 'package:getx_test/app/modules/app_job/job_home/job_home_binding.dart';

import '../../../common/getx/getz_view_binding.dart';
import '../../../common/styles/theme_constants.dart';
import '../../../common/widgets/tabbar/rrect_indicator.dart';
import '../../../routes/app_pages.dart';
import '../../test/sliver_widgets/widgets/sticky_usage.dart';
import '../widgets/course_item.dart';
import 'job_home_controller.dart';

class JobHomeView extends GetzViewBindng<JobHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: ThemeConstants.hSpacingSm,
          toolbarHeight: 60.w,
          title: _buildAppBarContent(),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: _buildBanner(),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.all(ThemeConstants.hSpacingSm),
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(right: 3),
                            child: GestureDetector(
                              onTap: () =>
                                  Get.toNamed(Routes.JOB_COURSE_DETAIL),
                              child: ClipRRect(
                                  child: Image.asset('assets/images/ad01.png')),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(left: 3),
                            child: ClipRRect(
                                child: Image.asset('assets/images/ad02.png'))))
                  ],
                ),
              )),
              SliverPersistentHeader(
                pinned: true,
                delegate: StickyTabBarDelegate(
                  child: KuGouTabBar(
                    isScrollable: true,
                    labelColor: Color(0xFF24CF5F),
                    unselectedLabelColor: Color(0xFFB8C0D4),
                    controller: controller.tabController,
                    labelStyle: TextStyle(fontSize: 18),
                    unselectedLabelStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    tabs: controller.tabs.asMap().entries.map((item) {
                      return Tab(
                        child: Text(
                          item.value,
                        ),
                      );
                    }).toList(),
                    padding: EdgeInsets.zero,
                    indicator: const RRecTabIndicator(
                        radius: 5,
                        insets: EdgeInsets.only(bottom: 5),
                        color: ThemeConstants.brandPrimary),
                    indicatorMinWidth: 10,
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: controller.tabController,
            children: <Widget>[
              Container(
                color: ThemeConstants.fillBody,
                child: ScrollConfiguration(
                  behavior: OverScrollBehavior(),
                  child: ListView(
                    children: controller.colorList.map((e) {
                      return CourseItem();
                    }).toList(),
                  ),
                ),
              ),
              Center(child: Text('Content of Profile')),
              Center(child: Text('Content of Profile')),
              Center(child: Text('Content of Profile')),
              Center(child: Text('Content of Profile')),
            ],
          ),
        ));
  }

  Container _buildBanner() {
    return Container(
      height: 140.w,
      margin: EdgeInsets.only(top: 10),
      // padding: EdgeInsets.all(ThemeConstants.hSpacingSm),
      child: Swiper(
          itemBuilder: (context, index) {
            final image = controller.bannerUrlList[index];
            return Container(
              padding:
                  EdgeInsets.symmetric(horizontal: ThemeConstants.hSpacingSm),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
          indicatorLayout: PageIndicatorLayout.COLOR,
          autoplay: true,
          itemCount: controller.bannerUrlList.length,
          pagination: const SwiperPagination()),
    );
  }

  Widget _buildAppBarContent() {
    return Column(children: [
      Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image.asset(
              'assets/icons/icon.png',
              height: 44.w,
              width: 44.w,
            ),
          ),
          Spacez.hSpacezXs,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '无忧兼职 ｜ 兼职无忧',
                style: Stylez.textHead,
              ),
              Text(
                '低门槛·多重岗位审核·100%客服响应',
                style: Stylez.textCaption,
              ),
            ],
          )
        ],
      )
    ]);
  }

  @override
  Bindings? binding() {
    return JobHomeBinding();
  }
}
