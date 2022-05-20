import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/app/common/getx/getz_view_binding.dart';
import 'package:getx_test/app/common/styles/zstyle_constants.dart';
import 'package:getx_test/app/modules/app_job/job_my/job_my_binding.dart';

import '../../../common/widgets/menu_item.dart';
import 'job_my_controller.dart';

class JobMyView extends GetzViewBindng<JobMyController> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // width: double.infinity,
        padding: EdgeInsets.fromLTRB(20, 20 + statusBarHeight, 20, 20),
        child: Column(children: [
          // 个人信息
          Row(
            children: [
              // 头像
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: 50,
                  height: 50,
                  child: Image.asset('assets/images/customer.jpg'),
                ),
              ),
              // 昵称
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text('点击登录', style: TextStyle(fontSize: 16)),
              ),
              const Expanded(child: Text('')),
              // 设置
              GestureDetector(
                onTap: () => {},
                child: Icon(
                  Icons.settings,
                  color: ZStyleConstans.colorTextSecondary,
                ),
              )
            ],
          ),

          // 数据预览
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(4, 4),
                      color: ZStyleConstans.colorTextHint,
                      blurRadius: 10)
                ]),
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () => {},
                  child: Column(
                    children: [
                      Text('0'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '收藏',
                        style: TextStyle(color: ZStyleConstans.colorTextHint),
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text('0'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '历史',
                      style: TextStyle(color: ZStyleConstans.colorTextHint),
                    )
                  ],
                ))
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
          ),

          // 菜单
          Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(2, 1),
                      color: ZStyleConstans.colorTextHint,
                      blurRadius: 10)
                ]),
            child: Column(children: [
              ///积分排行榜
              GestureDetector(
                onTap: () => {},
                child: Container(
                  padding: const EdgeInsets.only(top: 16, left: 16, bottom: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.volume_down,
                        size: 20,
                        color: Color(0xFF24CF5F),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '快来查看积分排行榜吧~',
                        style:
                            TextStyle(color: Color(0xFF24CF5F), fontSize: 13),
                      )
                    ],
                  ),
                ),
              ),
              MenuItemWidget(
                icon: Icons.perm_identity,
                title: '意见反馈',
                endIconColor: ZStyleConstans.colorTextHint,
                onTap: () => {},
              ),
              MenuItemWidget(
                icon: Icons.perm_identity,
                title: '帮助中心',
                endIconColor: ZStyleConstans.colorTextHint,
              ),
              MenuItemWidget(
                icon: Icons.perm_identity,
                title: '关于我们',
                endIconColor: ZStyleConstans.colorTextHint,
              )
            ]),
          )
        ]),
      ),
    );
  }

  @override
  Bindings? binding() {
    return JobMyBinding();
  }
}
