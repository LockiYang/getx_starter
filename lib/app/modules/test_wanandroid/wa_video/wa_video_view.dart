import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'package:getx_test/app/common/getx/getz_view_keep_alive.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_video/wa_video_binding.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../common/widgets/fijkplayer/image_extends.dart';
import '../../../common/widgets/fijkplayer/video_banner.dart';
import '../../../common/widgets/fijkplayer/video_factory.dart';
import 'wa_video_controller.dart';

class WaVideoView extends GetzViewKeepAlive<WaVideoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                /// 加载中
                Visibility(
                    visible: controller.loadStatus == 0,
                    child: Center(child: Text('loadding...'))),

                /// 加载成功
                Visibility(
                    visible: controller.loadStatus == 1,
                    child: SmartRefresher(
                        controller: controller.refreshController,
                        enablePullDown: true,
                        enablePullUp: true,
                        onRefresh: () => controller.refreshData(),
                        onLoading: () => controller.loadingData(),
                        // header: _buildHeader(),
                        // footer: _buildFooter(),
                        child: CustomScrollView(
                          controller: controller.scrollController,
                          slivers: [_buildBannerListSliver(), _buildItemListSlivers()],
                        ))),

                /// 加载数据为空
                Visibility(
                    visible: controller.loadStatus == 2,
                    child: Center(child: Text('empty...'))),

                /// 加载出错
                Visibility(
                    visible: controller.loadStatus == 3,
                    child: Center(child: Text('error...'))),
              ],
            ),
          ),
        ));
  }

  SliverList _buildItemListSlivers() {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      bool isNotExistAuthor =
          controller.itemList[index]!.data!.author == null ? true : false;
      String videoTitle = controller.itemList[index]!.data!.title ?? "暂无";
      String videoCategory = controller.itemList[index]!.data!.category ?? "暂无";
      String videoPoster = controller.itemList[index]!.data!.cover!.feed ?? "";
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Column(
          children: [
            SizedBox(
              height: 210,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: VideoFactory(
                      id: controller.itemList[index]!.data!.id!.toString(),
                      playUrl: controller.itemList[index]!.data!.playUrl ?? "",
                      title: controller.itemList[index]!.data!.title ?? "暂无",
                      typeName:
                          controller.itemList[index]!.data!.category ?? "暂无",
                      desText:
                          controller.itemList[index]!.data!.description ?? "暂无",
                      subTime:
                          controller.itemList[index]!.data!.releaseTime != null
                              ? DateTime.fromMillisecondsSinceEpoch(controller
                                      .itemList[index]!.data!.releaseTime!)
                                  .toString()
                                  .substring(0, 19)
                              : "暂无",
                      avatarUrl: controller.itemList[index]!.data!.author !=
                              null
                          ? (controller.itemList[index]!.data!.author!.icon ??
                              "")
                          : "",
                      authorDes:
                          controller.itemList[index]!.data!.author != null
                              ? (controller.itemList[index]!.data!.author!
                                      .description ??
                                  "暂无")
                              : "暂无",
                      authorName: controller.itemList[index]!.data!.author !=
                              null
                          ? (controller.itemList[index]!.data!.author!.name ??
                              "暂无")
                          : "暂无",
                      videoPoster: videoPoster,
                      child: ImageExends(
                        imgUrl: videoPoster,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Text(
                        videoCategory,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            VideoBanner(
              avatarUrl: controller.itemList[index]!.data!.author!.icon ?? "",
              rowTitle: videoTitle,
              isAssets: isNotExistAuthor,
              rowDes: controller.itemList[index]!.data!.author!.name ?? "暂无",
              slotChild: Text('Share'),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              height: 1,
              color: Colors.black12,
            ),
          ],
        ),
      );
    }, childCount: controller.itemList.length));
  }

  SliverToBoxAdapter _buildBannerListSliver() {
    return SliverToBoxAdapter(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
                height: 210,
                child: Swiper(
                  autoplay: true,
                  controller: controller.swiperController,
                  itemCount: controller.bannerList.length,
                  itemBuilder: (context, index) {
                    String posterUrl =
                        controller.bannerList[index]!.data!.cover!.feed ?? "";
                    String videoTitle =
                        controller.bannerList[index]!.data!.title ?? "暂无";
                    return SizedBox(
                      height: 220,
                      child: Stack(
                        children: [
                          Positioned(
                            child: VideoFactory(
                              id: controller.bannerList[index]!.data!.id!
                                  .toString(),
                              playUrl:
                                  controller.bannerList[index]!.data!.playUrl ??
                                      "",
                              title:
                                  controller.bannerList[index]!.data!.title ??
                                      "暂无",
                              typeName: controller
                                      .bannerList[index]!.data!.category ??
                                  "暂无",
                              desText: controller
                                      .bannerList[index]!.data!.description ??
                                  "暂无",
                              subTime: controller.bannerList[index]!.data!
                                          .releaseTime !=
                                      null
                                  ? DateTime.fromMillisecondsSinceEpoch(
                                          controller.bannerList[index]!.data!
                                              .releaseTime!)
                                      .toString()
                                      .substring(0, 19)
                                  : "暂无",
                              avatarUrl:
                                  controller.bannerList[index]!.data!.author !=
                                          null
                                      ? (controller.bannerList[index]!.data!
                                              .author!.icon ??
                                          "")
                                      : "",
                              authorDes:
                                  controller.bannerList[index]!.data!.author !=
                                          null
                                      ? (controller.bannerList[index]!.data!
                                              .author!.description ??
                                          "暂无")
                                      : "暂无",
                              authorName:
                                  controller.bannerList[index]!.data!.author !=
                                          null
                                      ? (controller.bannerList[index]!.data!
                                              .author!.name ??
                                          "暂无")
                                      : "暂无",
                              videoPoster: posterUrl,
                              child: ImageExends(
                                imgUrl: posterUrl,
                              ),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              height: 40,
                              color: const Color.fromRGBO(0, 0, 0, 0.5),
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  videoTitle,
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            bottom: 0,
                            left: 0,
                            right: 0,
                          ),
                        ],
                      ),
                    );
                  },
                  pagination: const SwiperPagination(
                      margin: EdgeInsets.only(bottom: 45)),
                ))));
  }

  @override
  Bindings? binding() {
    return WaVideoBinding();
  }
}
