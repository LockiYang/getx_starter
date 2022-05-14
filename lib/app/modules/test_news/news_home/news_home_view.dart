import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/news.dart';
import '../../../utils/date_util.dart';
import '../common/app_colors.dart';
import '../widgets/button.dart';
import '../widgets/image.dart';
import '../widgets/input.dart';
import 'news_home_controller.dart';
import 'widgets/ad.dart';

class NewsHomeView extends GetView<NewsHomeController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildCategories(),
          Divider(height: 1),
          _buildRecommend(),
          Divider(height: 1),
          _buildChannels(),
          Divider(height: 1),
          _buildLists(),
          Divider(height: 1),
          _buildLetters()
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return Obx(
      () => controller.categories.value == null
          ? Container()
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: controller.categories.value!.map<Widget>((item) {
                  return Container(
                    alignment: Alignment.center,
                    height: 52.h,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      child: Text(
                        item.title,
                        style: TextStyle(
                          color: controller.selCategoryCode.value == item.code
                              ? AppColors.secondaryElementText
                              : AppColors.primaryText,
                          fontSize: 18.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onTap: () {
                        // 拉取数据
                        controller.asyncLoadNewsData(item.code);
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
    );
  }

  Widget _buildRecommend() {
    return Obx(() => controller.newsRecommend.value == null
        ? Container()
        : Container(
            margin: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 图
                InkWell(
                  onTap: () {
                    // ExtendedNavigator.rootNavigator.pushNamed(
                    //   Routes.detailsPageRoute,
                    //   arguments: DetailsPageArguments(item: item),
                    // );
                  },
                  child: netImageCached(
                    controller.newsRecommend.value!.thumbnail!,
                    width: 335.w,
                    height: 290.h,
                  ),
                ),
                // 作者
                Container(
                  margin: EdgeInsets.only(top: 14.h),
                  child: Text(
                    controller.newsRecommend.value!.author!,
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.normal,
                      color: AppColors.thirdElementText,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                // 标题
                InkWell(
                  onTap: () {
                    // ExtendedNavigator.rootNavigator.pushNamed(
                    //   Routes.detailsPageRoute,
                    //   arguments: DetailsPageArguments(item: item),
                    // );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Text(
                      controller.newsRecommend.value!.title!,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryText,
                        fontSize: 24.sp,
                        height: 1,
                      ),
                    ),
                  ),
                ),
                // 一行 3 列
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // 分类
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 120,
                        ),
                        child: Text(
                          controller.newsRecommend.value!.category!,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.normal,
                            color: AppColors.secondaryElementText,
                            fontSize: 14.sp,
                            height: 1,
                          ),
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                      ),
                      // 添加时间
                      Container(
                        width: 15.w,
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 120,
                        ),
                        child: Text(
                          '• ${DateUtil.duTimeLineFormat(controller.newsRecommend.value!.addtime!)}',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.normal,
                            color: AppColors.thirdElementText,
                            fontSize: 14.sp,
                            height: 1,
                          ),
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                      ),
                      // 更多
                      Spacer(),
                      InkWell(
                        child: Icon(
                          Icons.more_horiz,
                          color: AppColors.primaryText,
                          size: 24,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
  }

  Widget _buildChannels() {
    return Obx(
      () => controller.channels.value == null
          ? Container()
          : Container(
              height: 137.w,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: controller.channels.value!.map<Widget>((item) {
                    // 项
                    return Container(
                      width: 70.w,
                      height: 97.w,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // 图标
                            Container(
                              height: 64.w,
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      height: 64.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Color.fromARGB(38, 27, 27, 29),
                                            offset: Offset(0, 5),
                                            blurRadius: 10,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(32)),
                                      ),
                                      child: Container(),
                                    ),
                                  ),
                                  Positioned(
                                    left: 10.w,
                                    top: 10.w,
                                    right: 10.w,
                                    child: Image.asset(
                                      "assets/images/channel-${item.code}.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // 标题
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                item.title,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                style: TextStyle(
                                  color: AppColors.thirdElementText,
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  height: 14.sp / 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
    );
  }

  Widget _buildLists() {
    return Obx(() => controller.newsPageList.value == null
        ? Container()
        : Column(
            children: controller.newsPageList.value!.items!.map<Widget>((item) {
              // 新闻行
              List<Widget> widgets = <Widget>[
                _buildListItem(item),
                Divider(height: 1),
              ];

              // 每 5 条 显示广告
              int index = controller.newsPageList.value!.items!.indexOf(item);
              if (((index + 1) % 5) == 0) {
                widgets.addAll(<Widget>[
                  AdWidget(),
                  Divider(height: 1),
                ]);
              }

              // 返回
              return Column(
                children: widgets,
              );
            }).toList(),
          ));
  }

  Widget _buildLetters() {
    return Container(
      margin: EdgeInsets.all(20.w),
      child: Column(
        children: <Widget>[
          // newsletter
          Row(
            children: <Widget>[
              Text(
                'Newsletter',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.thirdElement,
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: AppColors.thirdElementText,
                  size: 17.sp,
                ),
                onPressed: () {},
              ),
            ],
          ),

          // email
          inputEmailEdit(
            marginTop: 19,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
            isPassword: false,
            controller: null,
          ),

          // btn subcrible
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: btnFlatButtonWidget(
              onPressed: () {},
              width: 335.w,
              height: 44.h,
              fontWeight: FontWeight.w600,
              title: "Subscribe",
            ),
          ),

          // disc
          Container(
            margin: EdgeInsets.only(top: 29.h),
            width: 261.w,
            child: Text.rich(TextSpan(children: <TextSpan>[
              TextSpan(
                text: 'By clicking on Subscribe button you agree to accept',
                style: TextStyle(
                  color: AppColors.thirdElementText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
              TextSpan(
                text: ' Privacy Policy',
                style: TextStyle(
                  color: AppColors.secondaryElementText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // toastInfo(msg: 'Privacy Policy');
                  },
              ),
            ])),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(NewsItem item) {
    return Container(
      height: 161.w,
      padding: EdgeInsets.all(20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 图
          InkWell(
            onTap: () {
              // ExtendedNavigator.rootNavigator.pushNamed(
              //   Routes.detailsPageRoute,
              //   arguments: DetailsPageArguments(item: item),
              // );
            },
            child: SizedBox(
              width: 121.w,
              height: 121.w,
              child: netImageCached(
                item.thumbnail ?? "",
                width: 121.w,
                height: 121.w,
              ),
            ),
          ),
          // 右侧
          SizedBox(
            width: 194.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 作者
                Container(
                  margin: EdgeInsets.all(0),
                  child: Text(
                    item.author ?? "",
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.normal,
                      color: AppColors.thirdElementText,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                // 标题
                InkWell(
                  onTap: () {
                    // ExtendedNavigator.rootNavigator.pushNamed(
                    //   Routes.detailsPageRoute,
                    //   arguments: DetailsPageArguments(item: item),
                    // );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10.w),
                    child: Text(
                      item.title ?? "",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryText,
                        fontSize: 16.sp,
                        overflow: TextOverflow.clip,
                      ),
                      overflow: TextOverflow.clip,
                      maxLines: 3,
                    ),
                  ),
                ),
                // Spacer
                Spacer(),
                // 一行 3 列
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // 分类
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 60.w,
                        ),
                        child: Text(
                          item.category ?? "",
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.normal,
                            color: AppColors.secondaryElementText,
                            fontSize: 14.sp,
                          ),
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                      ),
                      // 添加时间
                      Container(
                        width: 15.w,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 100.w,
                        ),
                        child: Text(
                          '• ${DateUtil.duTimeLineFormat(item.addtime ?? DateTime(0))}',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.normal,
                            color: AppColors.thirdElementText,
                            fontSize: 14.sp,
                          ),
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                      ),
                      // 更多
                      Spacer(),
                      InkWell(
                        child: Icon(
                          Icons.more_horiz,
                          color: AppColors.primaryText,
                          size: 24,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
