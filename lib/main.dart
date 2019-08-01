import 'package:flutter/material.dart';
import 'home_page.dart';
import 'personal_category_page.dart';
import 'const_sets.dart';
import 'appraise_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new RootPage(),
      routes: {
        personalCategoryPageIdentify: (conetxt) {
          return PersonalCategoryPage();
        },
        appraisePageIdentify: (context) {
          return AppraisePage();
        }
      },
    );
  }
}

class RootPage extends StatefulWidget {
  @override
  _RootPagePageState createState() {
    // TODO: implement createState
    return _RootPagePageState();
  }
}

class _RootPagePageState extends State<RootPage>
    with SingleTickerProviderStateMixin {
  List<Widget> _children = [HomePage(), PlayPage(), MyPage()];
  TabController _controller;

  @override
  initState() {
    super.initState();
    _controller = TabController(length: _children.length, vsync: this);
  }

  List<Widget> _tabbars = [
    Tab(
      text: "首页",
      icon: new Icon(Icons.home),
    ),
    Icon(Icons.play_arrow),
    Tab(text: "账号", icon: new Icon(Icons.account_box)),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: new TabBarView(
          children: _children,
          controller: _controller,
        ),
        bottomNavigationBar: new TabBar(
          tabs: _tabbars,
          controller: _controller,
          onTap: (index) {
            _controller.animateTo(index);
          },
          labelColor: Colors.red,
          unselectedLabelColor: Colors.grey,
        ));
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.red,
    );
  }
}

class PlayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.green,
    );
  }
}
