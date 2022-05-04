import 'package:flutter/material.dart';

class DemoTabViewModel {
  final String title;
  final Widget widget;

  const DemoTabViewModel({
    required this.title,
    required this.widget,
  });
}

class DemoTabs extends StatelessWidget {
  final String title;
  final List<DemoTabViewModel> demos;
  final bool tabScrollable;
  final TabController tabController;

  DemoTabs({
    required this.title,
    required this.demos,
    this.tabScrollable = true,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          isScrollable: tabScrollable,
          tabs: demos.map((item) => Tab(text: item.title)).toList(),
          labelColor: Colors.black,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: demos.map((item) => item.widget).toList(),
      ),
    );
  }
}
