import 'package:flutter/material.dart';

class StickyDemo extends StatefulWidget {
  final String title;

  StickyDemo({Key? key, required this.title}) : super(key: key);

  @override
  _StickyDemoState createState() => _StickyDemoState();
}

class _StickyDemoState extends State<StickyDemo>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                height: 500,
                color: Colors.red,
              ),
            ),
            SliverAppBar(
              pinned: false,
              elevation: 0,
              title: Text(widget.title),
              // expandedHeight: 250,
              // flexibleSpace: FlexibleSpaceBar(
              //   title: Text(widget.title),
              //   background: Image.network(
              //     'http://img1.mukewang.com/5c18cf540001ac8206000338.jpg',
              //     fit: BoxFit.cover,
              //   ),
              // ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: StickyTabBarDelegate(
                child: TabBar(
                  labelColor: Colors.black,
                  controller: tabController,
                  tabs: <Widget>[
                    Tab(text: 'Home'),
                    Tab(text: 'Profile'),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  Center(child: Text('Content of Home')),
                  Center(child: Text('Content of Profile')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    debugPrint('shrinkOffset: ' + shrinkOffset.toString());
    return Material(
      color: Colors.white,
      child: child,
    );
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
