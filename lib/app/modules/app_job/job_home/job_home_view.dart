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
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   titleSpacing: ThemeConstants.hSpacingSm,
        //   toolbarHeight: 60.w,
        //   title: _buildAppBarContent(),
        // ),
        body: RefreshIndicator(
          // controller: controller.refreshController,
          // scrollController: controller.scrollController,
          // enablePullDown: true,
          // enablePullUp: true,
          //可滚动组件在滚动时会发送ScrollNotification类型的通知
          notificationPredicate: (ScrollNotification notifation) {
            //该属性包含当前ViewPort及滚动位置等信息
            ScrollMetrics scrollMetrics = notifation.metrics;
            if (scrollMetrics.minScrollExtent == 0) {
              return true;
            } else {
              return false;
            }
          },
          onRefresh: () async {
            //模拟网络刷新 等待2秒
            await Future.delayed(Duration(milliseconds: 2000));
            //返回值以结束刷新
            return Future.value(true);
          },
          // onLoading: () => controller.loadingData(),
          child: NestedScrollView(
            controller: controller.scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  pinned: true,
                  automaticallyImplyLeading: false,
                  titleSpacing: ThemeConstants.hSpacingSm,
                  collapsedHeight: 60.w,
                  expandedHeight: 60.w,
                  toolbarHeight: 60.w,
                  title: _buildAppBarContent(),
                ),
                SliverToBoxAdapter(
                  child: _buildBanner(),
                ),
                // SliverToBoxAdapter(
                //     child: Padding(
                //   padding: EdgeInsets.all(ThemeConstants.hSpacingSm),
                //   child: _buildAd(),
                // )),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: StickyTabBarDelegate(
                    child: _buildTabbar(),
                  ),
                ),
              ];
            },
            body: _buildTabBarView(),
          ),
        ));
  }

  // dynamic _buildTabBarView() {
  //   return pullToRefresh.SmartRefresher(
  //     controller: controller.refreshController,
  //     enablePullDown: true,
  //     enablePullUp: true,
  //     onLoading: controller.loadingData(),
  //     onRefresh: controller.refreshData(),
  //     child: TabBarView(
  //         controller: controller.tabController,
  //         children: List.generate(controller.tabs.length, (index) {
  //           return Container(
  //             color: ThemeConstants.fillBody,
  //             child: ScrollConfiguration(
  //               behavior: OverScrollBehavior(),
  //               child: ListView(
  //                 children: controller.tabsData[index] == null
  //                     ? []
  //                     : List.generate(controller.tabsData[index]?.length ?? 0,
  //                         (i) {
  //                         return CourseItem(
  //                           post: controller.tabsData[index]![i],
  //                         );
  //                       }),
  //               ),
  //             ),
  //           );
  //         })),
  //   );
  // }

  dynamic _buildTabBarView() {
    return TabBarView(
        controller: controller.tabController,
        children: List.generate(controller.tabs.length, (index) {
          return Container(
            color: ThemeConstants.fillBody,
            child: ScrollConfiguration(
              behavior: OverScrollBehavior(),
              child: ListView(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.all(0),
                children: controller.tabsData[index] == null
                    ? []
                    : List.generate(controller.tabsData[index]?.length ?? 0,
                        (i) {
                        return CourseItem(
                          post: controller.tabsData[index]![i],
                        );
                      }),
              ),
            ),
          );
        }));
  }

  KuGouTabBar _buildTabbar() {
    return KuGouTabBar(
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
            item.value.name,
          ),
        );
      }).toList(),
      padding: EdgeInsets.zero,
      indicator: const RRecTabIndicator(
          radius: 5,
          insets: EdgeInsets.only(bottom: 5),
          color: ThemeConstants.brandPrimary),
      indicatorMinWidth: 10,
    );
  }

  Row _buildAd() {
    return Row(
      children: [
        Expanded(
            child: Padding(
                padding: EdgeInsets.only(right: 3),
                child: GestureDetector(
                  onTap: () => Get.toNamed(Routes.JOB_COURSE_DETAIL),
                  child:
                      ClipRRect(child: Image.asset('assets/images/ad01.png')),
                ))),
        Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 3),
                child: ClipRRect(child: Image.asset('assets/images/ad02.png'))))
      ],
    );
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
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
          indicatorLayout: PageIndicatorLayout.COLOR,
          autoplay: true,
          itemCount: controller.bannerUrlList.length,
          pagination: SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: SwiperCustomPagination(builder: ((context, config) {
                return NLIndicator(
                  currentIndex: config.activeIndex,
                  count: controller.bannerUrlList.length,
                );
              })))),
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

class NLIndicator extends StatelessWidget {
  const NLIndicator({Key? key, required this.currentIndex, required this.count})
      : super(key: key);

  final int currentIndex;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(count, (index) {
          return currentIndex == index
              ? Container(
                  width: 12,
                  height: 6,
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6)),
                )
              : Container(
                  width: 6,
                  height: 6,
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(6)),
                );
        }),
      ),
    );
  }
}
