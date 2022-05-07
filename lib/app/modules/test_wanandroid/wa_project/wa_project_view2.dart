import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/data/repositorys/wan_android_api.dart';
import 'package:getx_test/app/modules/test_wanandroid/wa_project/widgets/project_list_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/models/project.dart';

class WaProjectView2 extends StatefulWidget {
  const WaProjectView2({Key? key}) : super(key: key);

  @override
  State<WaProjectView2> createState() => _WaProjectView2State();
}

class _WaProjectView2State extends State<WaProjectView2> {
  // List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  int pageNum = 0;
  List<Project> projects = <Project>[];
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  WanAndroidApi wanapi = Get.find<WanAndroidApi>();

  void _onRefresh() {
    // monitor network fetch
    // await Future.delayed(Duration(milliseconds: 1000));
    pageNum = 0;
    wanapi.getProjects(
      pageNum,
      success: (data, over) => {
        setState(() {
          projects.clear();
          projects.addAll(data);
        })
      },
    );
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() {
    // monitor network fetch
    // await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length + 1).toString());
    wanapi.getProjects(
      ++pageNum,
      success: (data, over) => {
        setState(() {
          projects.addAll(data);
        })
      },
    );
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (c, i) => ProjectListItem(projects[i]),
          itemCount: projects.length,
        ),
      ),
    );
  }
}
