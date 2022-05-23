import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:getx_test/app/common/getx/getz_view_binding.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_home/wa_ask/wa_ask_view.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_home/wa_home_binding.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_home/wa_main/wa_main_view.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_home/wa_square/wa_square_view.dart';

import '../../../common/widgets/banner/banner_widget.dart';
import '../../../routes/app_pages.dart';
import 'wa_home_controller.dart';

class WaHomeView extends GetzViewBindng<WaHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        BannerWidget(
          controller.banners,
          height: 140,
          onTap: (index) {},
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: TabBar(
                isScrollable: true, //不充满一行
                labelColor: Color(0xFF24CF5F),
                unselectedLabelColor: Color(0xFFB8C0D4),
                controller: controller.tabController,
                labelStyle: TextStyle(
                    color: Color(0xFFFE8C28),
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
                unselectedLabelStyle:
                    TextStyle(color: Color(0xFFFFAE2E), fontSize: 16),
                indicator: const BoxDecoration(),
                tabs: [
                  Tab(
                    text: '首页',
                  ),
                  Tab(
                    text: '广场',
                  ),
                  Tab(
                    text: '问答',
                  )
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            InkWell(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              onTap: () => Get.toNamed(Routes.WA_SEARCH),
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SvgPicture.asset(
                  'assets/svgs/search.svg',
                  color: Colors.black87,
                  width: 30,
                ),
              ),
            )
          ],
        ),
        Expanded(
            child: TabBarView(
                controller: controller.tabController,
                children: [WaMainView(), WaSquareView(), WaAskView()]))
      ],
    ));
  }

  @override
  Bindings? binding() {
    return WaHomeBinding();
  }
}
