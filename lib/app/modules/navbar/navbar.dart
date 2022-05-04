import 'package:flutter/material.dart';
import 'package:getx_test/app/modules/home/home_view.dart';
import 'package:getx_test/app/modules/message/message_view.dart';
import 'package:getx_test/app/modules/my/my_view.dart';
import 'package:getx_test/app/styles/app_theme.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  // 当前选中tab
  int _curIndex = 0;
  final List<Widget> navbarBodyItems = [HomeView(), MessageView(), MyView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navbarBodyItems[_curIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _curIndex,
        onTap: (index) {
          setState(() {
            _curIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: '消息'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: '我的')
        ],
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        selectedItemColor: appColorPrimary,
        unselectedItemColor: appColorMedium,
      ),
    );
  }
}
