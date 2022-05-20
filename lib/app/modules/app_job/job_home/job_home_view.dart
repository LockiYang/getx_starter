import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/common/styles/zstyle.dart';
import 'package:getx_test/app/common/widgets/over_scroll_behavior.dart';
import 'package:getx_test/app/common/widgets/tabbar/kugou_tabbar.dart';
import 'package:getx_test/app/modules/app_job/job_home/job_home_binding.dart';

import '../../../common/getx/getz_view_binding.dart';
import '../../../common/styles/zstyle_constants.dart';
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
        body: RefreshIndicator(
          // 解决NestedScrollView和RefreshIndicator的滑动冲突
          // NestedScrollView有内外两个controller控制器。（out控制header，inner控制body。只有当out不能滚动了才会滚动inner）
          notificationPredicate: (ScrollNotification notifation) {
            return true;
          },
          onRefresh: controller.refreshData,
          child: NestedScrollView(
            controller: controller.scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  pinned: true,
                  automaticallyImplyLeading: false,
                  titleSpacing: ZStyleConstans.hSpacingSm,
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
                //   padding: EdgeInsets.all(ZStyleConstans.hSpacingSm),
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

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: controller.loadStatus == 0 ? 1.0 : 0,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  TabBarView _buildTabBarView() {
    return TabBarView(
        controller: controller.tabController,
        children: List.generate(controller.tabs.length, (tabIndex) {
          return Container(
            color: ZStyleConstans.fillBody,
            child: ScrollConfiguration(
                behavior: OverScrollBehavior(),
                child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount:
                        controller.isListEmpty(controller.tabsData[tabIndex])
                            ? 1
                            : controller.tabsData[tabIndex]!.length + 1,
                    itemBuilder: (context, itemIndex) {
                      if (controller.isListEmpty(controller.tabsData[tabIndex])) {
                        if (controller.loadStatus == 0) {
                            return _buildProgressIndicator();
                          } else if (controller.loadStatus == 1) {
                            return Text('');
                          } else if (controller.loadStatus == 2) {
                            return Text('无数据2');
                          } else if (controller.loadStatus == 3) {
                            return Text('加载失败，重试');
                          } else {
                            return Text('');
                          }
                      } else {
                        if (controller.tabsData[tabIndex]!.length == itemIndex) {
                          if (controller.loadStatus == 0) {
                            return _buildProgressIndicator();
                          } else if (controller.loadStatus == 1 && !controller.hasMore) {
                            return Text('没有更多了');
                          } else if (controller.loadStatus == 2) {
                            return Text('无数据3');
                          } else if (controller.loadStatus == 3) {
                            return Text('加载失败，重试');
                          } else {
                            return Text('');
                          }
                        } else {
                          return CourseItem(
                            post: controller.tabsData[tabIndex]![itemIndex],
                          );
                        }
                      }
                    })),
          );
        }));
  }

  KuGouTabBar _buildTabbar() {
    return KuGouTabBar(
      isScrollable: true,
      labelColor: ZStyleConstans.colorTextBase,
      unselectedLabelColor: ZStyleConstans.colorTextSecondary,
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
          color: ZStyleConstans.brandPrimary),
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
      // padding: EdgeInsets.all(ZStyleConstans.hSpacingSm),
      child: Swiper(
          itemBuilder: (context, index) {
            final image = controller.bannerUrlList[index];
            return Container(
              padding:
                  EdgeInsets.symmetric(horizontal: ZStyleConstans.hSpacingSm),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(ZStyleConstans.radiusSm),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.fill,
                  )),
            );
          },
          indicatorLayout: PageIndicatorLayout.COLOR,
          autoplay: controller.bannerUrlList.isNotEmpty,
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
                style: ZStyle.textHead,
              ),
              Text(
                '低门槛·多重岗位审核·100%客服响应',
                style: ZStyle.textCaption,
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
              : Opacity(
                  opacity: 0.4,
                  child: Container(
                    width: 6,
                    height: 6,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(6)),
                  ),
                );
        }),
      ),
    );
  }
}
