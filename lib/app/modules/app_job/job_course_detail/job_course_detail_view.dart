import 'package:bruno/bruno.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_test/app/common/getx/getz_view.dart';
import 'package:getx_test/app/common/styles/zstyle.dart';
import 'package:getx_test/app/common/styles/zstyle_constants.dart';
import 'package:getx_test/app/common/widgets/button/basic_button.dart';
import 'package:getx_test/app/modules/app_job/services/config_service.dart';
import 'package:getx_test/app/modules/app_job/widgets/course_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../common/utils/multi_click_util.dart';
import '../../../common/widgets/avatar_stack.dart';
import '../../../common/widgets/button/zbutton_sm.dart';
import '../../../common/widgets/fijkplayer/fijkplayer_skin.dart';
import '../../../routes/app_pages.dart';
import '../../test/custom_icon/widgets/antd_icons.dart';
import '../job_adding_info/job_adding_info_view.dart';
import 'job_course_detail_controller.dart';

class JobCourseDetailView extends GetzView<JobCourseDetailController> {
  const JobCourseDetailView({Key? key, String? tag})
      : super(key: key, tag: tag);
  @override
  Widget build(BuildContext context) {
    final double bottomHeight = MediaQuery.of(context).padding.bottom;
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SmartRefresher(
                controller: controller.refreshController,
                enablePullDown: false,
                enablePullUp: true,
                onLoading: controller.loadingData,
                child: CustomScrollView(
                  physics: ClampingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: _buildPlayer(),
                    ),
                    SliverToBoxAdapter(
                      child: _buildHeader(),
                    ),
                    SliverToBoxAdapter(
                      child: _buildCando(),
                    ),
                    SliverToBoxAdapter(
                      child: _buildCourseInfo(),
                    ),
                    SliverToBoxAdapter(
                      child: _buildCompany(),
                    ),
                    SliverToBoxAdapter(
                      child: _buildTips(),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                          alignment: Alignment.topLeft,
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(
                              ZStyleConstans.vSpacingMd,
                              ZStyleConstans.vSpacingMd,
                              ZStyleConstans.vSpacingMd,
                              0),
                          child: Text(
                            '大家都在看',
                            style: ZStyle.textSubHead,
                          )),
                    ),
                    SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                      return CourseItem(
                        post: controller.data[index],
                      );
                    }, childCount: controller.data.length))
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 6, 20, bottomHeight),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => MultiClickUtil.debounce(
                        () => {controller.saveCollect()}),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.only(right: 10),
                      child: Column(children: [
                        controller.isCollect
                            ? Icon(Icons.star)
                            : Icon(Icons.star_border),
                        Text(
                          '收藏',
                          style: ZStyle.textCaption,
                        )
                      ]),
                    ),
                  ),
                  Expanded(
                    child: _buildSubscribeBtn(controller.subcribeBtnType),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscribeBtn(int type) {
    if (type == 1) {
      return BasicButtom(
        text: ConfigService.to.subscribeButtonName,
        alignment: Alignment.center,
        // onTap: () => _noInfoSubscribe(),
        onTap: controller.subscribe,
      );
    } else if (type == 2) {
      return BasicButtom(
        text: ConfigService.to.positionProgressButtonName,
        alignment: Alignment.center,
        // onTap: () => _noInfoSubscribe(),
        onTap: controller.subscribe,
      );
    } else {
      return BasicButtom(
        text: '已下线',
        alignment: Alignment.center,
        isEnable: false,
      );
    }
  }

  void _noInfoSubscribe() {
    Get.bottomSheet(
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                '完善信息',
                style: ZStyle.textBebas,
              ),
            ),
            Column(
              children: List.generate(
                controller.infoItems.length,
                (index) {
                  return BasicInfoItem(
                    infoItem: controller.infoItems[index],
                    onSelect: (selectedIndexes) {
                      controller
                        ..infoItems[index].selectIndex = selectedIndexes[0]
                        ..update();
                    },
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: BasicButtom(
                text: '免费报名',
                alignment: Alignment.center,
                constraints: BoxConstraints.expand(width: 160, height: 44),
                onTap: () => {},
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  List<Widget> _buildTags() {
    if (controller.tags.isNotEmpty) {
      List<String> tagList = controller.tags.split(',');
      if (tagList.isNotEmpty) {
        return List.generate(
            tagList.length,
            (index) => BrnStateTag(
                  tagText: tagList[index],
                  tagState: TagState.invalidate,
                ));
      }
    }
    return [];
  }

  Container _buildCompany() {
    return Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: ZStyleConstans.vSpacingMd),
        padding: EdgeInsets.all(ZStyleConstans.vSpacingMd),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '讲师介绍',
              style: ZStyle.textSubHead,
            ),
            Spacez.vSpacezSm,
            Container(
              alignment: Alignment.topLeft,
              width: double.infinity,
              padding: EdgeInsets.all(ZStyleConstans.vSpacingMd),
              decoration: BoxDecoration(
                  color: ZStyleConstans.fillBody,
                  borderRadius: BorderRadius.circular(ZStyleConstans.radiusMd)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            controller.personName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          BrnStateTag(
                            tagText: '金牌讲师',
                            tagState: TagState.waiting,
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: controller.personLogo.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: controller.personLogo,
                                width: 40,
                                height: 40,
                                fit: BoxFit.fill,
                              )
                            : Container(),
                      )
                    ],
                  ),
                  Spacez.vSpacezXs,
                  Dividerz.dividerH1,
                  Spacez.vSpacezXs,
                  Text(
                    controller.personDesc,
                    style: ZStyle.textBase,
                  )
                ],
              ),
            ),
            Spacez.vSpacezMd,
            Text(
              '授课机构',
              style: ZStyle.textSubHead,
            ),
            Spacez.vSpacezSm,
            Container(
              alignment: Alignment.topLeft,
              width: double.infinity,
              padding: EdgeInsets.all(ZStyleConstans.vSpacingMd),
              decoration: BoxDecoration(
                  color: ZStyleConstans.fillBody,
                  borderRadius: BorderRadius.circular(ZStyleConstans.radiusMd)),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: ZStyleConstans.vSpacingMd),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: Icon(
                      AntdIcons.home,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.companyAlias,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '企业认证',
                        style: ZStyle.textCaption,
                      )
                    ],
                  )),
                  Icon(
                    AntdIcons.right,
                    size: 16,
                    color: ZStyleConstans.colorTextHint,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Container _buildCando() {
    return Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: ZStyleConstans.vSpacingMd),
        padding: EdgeInsets.all(ZStyleConstans.vSpacingMd),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '学成可做',
              style: ZStyle.textSubHead,
            ),
            Spacez.vSpacezSm,
            SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.industryList.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        CachedNetworkImage(
                            imageUrl: controller.industryList[index].bg),
                        Spacez.hSpacezMd
                      ],
                    );
                  }),
            )
          ],
        ));
  }

  Container _buildCourseInfo() {
    return Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: ZStyleConstans.vSpacingMd),
        padding: EdgeInsets.all(ZStyleConstans.vSpacingMd),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '课程介绍',
              style: ZStyle.textSubHead,
            ),
            Spacez.vSpacezSm,
            Text(
              controller.postDetail,
              style: ZStyle.textBase,
            ),
          ],
        ));
  }

  Container _buildTips() {
    return Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: ZStyleConstans.vSpacingMd),
        padding: EdgeInsets.all(ZStyleConstans.vSpacingMd),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '温馨提示',
                  style: ZStyle.textSubHead,
                ),
                ZbuttonSm(
                  text: '投诉',
                  color: Colors.blue,
                  onTap: () => Get.toNamed(Routes.JOB_FEEDBACK),
                )
              ],
            ),
            Spacez.vSpacezSm,
            Text(
              ConfigService.to.riskTips,
              style: TextStyle(fontSize: 12, color: Colors.red),
            )
          ],
        ));
  }

  Container _buildHeader() {
    return Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: ZStyleConstans.vSpacingMd),
      padding: EdgeInsets.all(ZStyleConstans.vSpacingMd),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          controller.title,
          style: ZStyle.textHead,
        ),
        SizedBox(
          height: 4,
        ),
        Wrap(
          spacing: ZStyleConstans.hSpacingXs,
          runSpacing: ZStyleConstans.hSpacingXs,
          children: _buildTags(),
        ),
        Spacez.vSpacezSm,
        Row(
          children: [
            AvatarStack(
              num: 20,
              size: 16,
              offset: 10,
            ),
            Text(
              '已有30123人报名',
              style: ZStyle.textCaption,
            )
          ],
        ),
        Spacez.vSpacezSm,
        Dividerz.dividerH1,
        Container(
          alignment: Alignment.topLeft,
          width: double.infinity,
          margin: EdgeInsets.only(top: ZStyleConstans.vSpacingMd),
          padding: EdgeInsets.symmetric(
              vertical: ZStyleConstans.vSpacingSm,
              horizontal: ZStyleConstans.hSpacingMd),
          decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              borderRadius: BorderRadius.circular(ZStyleConstans.radiusMd)),
          child: Row(
            children: [
              Icon(
                AntdIcons.fileCopyFill,
                size: 24,
                color: Colors.blueGrey,
              ),
              Spacez.hSpacezSm,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '免费领取资料',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '100G PS设计学习包',
                    style: ZStyle.textCaption,
                  )
                ],
              )),
              Icon(
                AntdIcons.right,
                size: 16,
                color: ZStyleConstans.colorTextHint,
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          width: double.infinity,
          margin: EdgeInsets.only(top: ZStyleConstans.vSpacingMd),
          padding: EdgeInsets.symmetric(
              vertical: ZStyleConstans.vSpacingSm,
              horizontal: ZStyleConstans.hSpacingMd),
          decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              borderRadius: BorderRadius.circular(ZStyleConstans.radiusMd)),
          child: Row(
            children: [
              Icon(
                AntdIcons.wechatFill,
                size: 24,
                color: Colors.blueGrey,
              ),
              Spacez.hSpacezSm,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '兼职接单群',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '学成可做兼职，收入可达800/天',
                    style: ZStyle.textCaption,
                  )
                ],
              )),
              Icon(
                AntdIcons.right,
                size: 16,
                color: ZStyleConstans.colorTextHint,
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Container _buildPlayer() {
    return Container(
      height: controller.playerBoxWidth,
      // color: Colors.black,
      child: !controller.isInitAnimition
          ? Container(
              height: controller.playerBoxWidth,
              color: Colors.black,
            )
          : FijkView(
              height: controller.playerBoxWidth,
              color: Colors.black,
              fit: FijkFit.cover,
              player: controller.player,
              panelBuilder: (
                FijkPlayer player,
                FijkData data,
                BuildContext context,
                Size viewSize,
                Rect texturePos,
              ) {
                /// 使用自定义的布局
                return CustomFijkPanel(
                  player: player,
                  viewSize: viewSize,
                  texturePos: texturePos,
                  pageContent: context,
                  showConfig: controller.vSkinCfg,
                  curPlayUrl: '',
                );
              },
            ),
    );
  }
}
