import 'package:flutter/material.dart';

class NestedUsage extends StatelessWidget {
  const NestedUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: 200,
        child: NestedScrollView(
            // physics: BouncingScrollPhysics(),
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              // 返回一个 Sliver 数组给外部可滚动组件。
              return <Widget>[
                // SliverAppBar(
                //   title: const Text('嵌套ListView'),
                //   pinned: true, // 固定在顶部
                //   forceElevated: innerBoxIsScrolled,
                // ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Text('Item ${index.toString()}');
                  }, childCount: 30),
                ),
              ];
            },
            body: SizedBox(
              height: 100,
              child: Container(color: Colors.red),
            )),
      ),
    );
  }
}
