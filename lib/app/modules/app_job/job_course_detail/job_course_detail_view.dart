import 'package:bruno/bruno.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/common/getx/getz_view_binding.dart';
import 'package:getx_test/app/common/styles/zstyle.dart';
import 'package:getx_test/app/common/styles/zstyle_constants.dart';
import 'package:getx_test/app/modules/app_job/job_course_detail/job_course_detail_binding.dart';

import '../../../common/widgets/fijkplayer/fijkplayer_skin.dart';
import '../../test/custom_icon/widgets/antd_icons.dart';
import 'job_course_detail_controller.dart';

class JobCourseDetailView extends GetzViewBindng<JobCourseDetailController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildPlayer(),
                    _buildHeader(),
                    _buildCourseInfo(),
                    _buildCompany(),
                    _buildRecommend(),
                  ],
                ),
              ),
            ),
            BrnBottomButtonPanel(
              mainButtonName: '免费报名',
              mainButtonOnTap: () {
                BrnToast.show('主按钮被点击', context);
              },
            )
          ],
        ),
      ),
    );
  }

  Container _buildRecommend() {
    return Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: ZStyleConstans.vSpacingMd),
        padding: EdgeInsets.all(ZStyleConstans.vSpacingMd),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Text(
              '大家都在看',
              style: ZStyle.textSubHead,
            ),
          ],
        ));
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
                            '霍尔老师',
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
                        child: Image(
                          image: AssetImage("assets/images/customer.jpg"),
                          width: 40,
                          height: 40,
                        ),
                      )
                    ],
                  ),
                  Spacez.vSpacezXs,
                  Dividerz.divider1,
                  Spacez.vSpacezXs,
                  Text(
                    '祖籍江苏省苏州市吴江区震泽镇，生于上海，中国篮球运动员，曾为中国国家篮球队队员，曾效力于中国篮球职业联赛上海大鲨鱼篮球俱乐部和美国国家篮球协会休斯敦火箭，外号“移动长城”。现任中国篮球协会主席。',
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
                        '看点设计',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '擅长设计，师资雄厚',
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
              '【报名须知】\n1、没有电脑，请勿报名!\n2、未满18岁，请勿报名!\n3、对设计与平面设计感兴趣!\n【课程讲解内容】\n第一部分：软件介绍、学习版本的选择、以及学习方向定位。\n第二部分：图层使用方法，文件打开保存的方法，注意事项。\n第三部分：工具的讲解，以及使用方法。\n第四部分：调色，滤镜等讲解\n第五部分：抠图\n第六部分：实例部分\n第七部分：动画制作\n第八部分：实战综合讲解\n【报名须知】\n1、没有电脑，请勿报名!\n2、未满18岁，请勿报名!\n3、对设计与平面设计感兴趣!\n【课程讲解内容】\n第一部分：软件介绍、学习版本的选择、以及学习方向定位。\n第二部分：图层使用方法，文件打开保存的方法，注意事项。\n第三部分：工具的讲解，以及使用方法。\n第四部分：调色，滤镜等讲解\n第五部分：抠图\n第六部分：实例部分\n第七部分：动画制作\n第八部分：实战综合讲解\n',
              style: ZStyle.textBase,
            ),
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
          '0基础免费P图 接单赚钱',
          style: ZStyle.textHead,
        ),
        SizedBox(
          height: 4,
        ),
        Wrap(
          spacing: ZStyleConstans.hSpacingXs,
          runSpacing: ZStyleConstans.hSpacingXs,
          children: [
            BrnStateTag(
              tagText: '非常好',
              tagState: TagState.succeed,
            ),
            BrnStateTag(
              tagText: '前景高',
              tagState: TagState.failed,
            ),
            BrnStateTag(
              tagText: '轻松在家',
              tagState: TagState.running,
            ),
          ],
        ),
        Spacez.vSpacezSm,
        Dividerz.divider1,
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
        )
        // Row(
        //   children: [
        //     AvatarStack(
        //       num: 10,
        //       size: 16,
        //       offset: 10,
        //     ),
        //     Text(
        //       '已有30123人报名',
        //       style: ZStyle.textCaption,
        //     )
        //   ],
        // ),
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
                  curPlayUrl: controller.curPlayUrl ?? "",
                );
              },
            ),
    );
  }

  @override
  Bindings? binding() {
    return JobCourseDetailBinding();
  }
}
