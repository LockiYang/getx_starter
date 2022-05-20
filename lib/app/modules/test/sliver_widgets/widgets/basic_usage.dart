import 'package:flutter/material.dart';

final List<Color> colorList = [
  Colors.red,
  Colors.orange,
  Colors.green,
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.pink,
  Colors.teal,
  Colors.deepPurpleAccent
];

/// SliverList	列表	ListView
/// SliverFixedExtentList	高度固定的列表	ListView，指定itemExtent时
/// SliverAnimatedList	添加/删除列表项可以执行动画	AnimatedList
/// SliverGrid	网格	GridView
/// SliverPrototypeExtentList	根据原型生成高度固定的列表	ListView，指定prototypeItem 时
/// SliverFillViewport	包含多个子组件，每个都可以填满屏幕	PageView
/// 
/// SliverPadding	Padding
/// SliverVisibility、SliverOpacity	Visibility、Opacity
/// SliverFadeTransition	FadeTransition
/// SliverLayoutBuilder	LayoutBuilder
/// 
/// SliverAppBar	对应 AppBar，主要是为了在 CustomScrollView 中使用。
/// SliverToBoxAdapter	一个适配器，可以将 RenderBox 适配为 Sliver，后面介绍。
/// SliverPersistentHeader	滑动到顶部时可以固定住，后面介绍。
class BasicDemo extends StatelessWidget {
  final String title;

  BasicDemo({Key? key, required this.title}) : super(key: key);

  Widget renderTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          renderTitle('SliverGrid'),
          SliverGrid.count(
            crossAxisCount: 3,
            children:
                colorList.map((color) => Container(color: color)).toList(),
          ),
          renderTitle('SliverList'),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(color: colorList[index]),
              childCount: colorList.length,
            ),
            itemExtent: 100,
          ),
        ],
      ),
    );
  }
}
