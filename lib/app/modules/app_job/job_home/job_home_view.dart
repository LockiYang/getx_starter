import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/common/styles/stylez.dart';
import 'package:getx_test/app/modules/app_job/job_home/job_home_binding.dart';

import '../../../common/getx/getz_view_binding.dart';
import '../../../common/styles/theme_constants.dart';
import '../../test/sliver_widgets/widgets/sticky_usage.dart';
import 'job_home_controller.dart';

class JobHomeView extends GetzViewBindng<JobHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: ThemeConstants.hSpacingMd,
          toolbarHeight: 60.w,
          title: _buildAppBarContent(),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _buildBanner(),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: StickyTabBarDelegate(
                child: TabBar(
                  labelColor: Colors.black,
                  controller: controller.tabController,
                  tabs: controller.tabs,
                ),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 100,
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    color: controller.colorList[index],
                  );
                },
                childCount: controller.colorList.length,
              ),
            )
          ],
        ));
  }

  Container _buildBanner() {
    return Container(
      height: 180,
      margin: EdgeInsets.only(top: 10),
      // padding: EdgeInsets.all(ThemeConstants.hSpacingMd),
      child: Swiper(
          itemBuilder: (context, index) {
            final image = controller.bannerUrlList[index];
            return Container(
              padding:
                  EdgeInsets.symmetric(horizontal: ThemeConstants.hSpacingMd),
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
