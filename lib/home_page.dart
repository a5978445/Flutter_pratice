import 'package:flutter/material.dart';
import 'recommend_page.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<Widget> _children;
  List<Tab> _tabs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _children = [
      ReCommendPage(),
      ReCommendPage(),
      ReCommendPage(),
      ReCommendPage(),
      ReCommendPage(),
      ReCommendPage(),
      ReCommendPage(),


    ];
    // 推荐，VIP，小说，直播，儿童，粤语，more
    _tabs =
        [ "推荐", "VIP", "小说", "直播", "儿童", "粤语", "more"
        ].map((name) => Tab(text: name))
            .toList();

    _tabController = TabController(length: _children.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
          title: new TabBar(
        tabs: _tabs,
        controller: _tabController,
        onTap: (index) {
          _tabController.animateTo(index);
        },
        labelColor: Colors.red,
        unselectedLabelColor: Colors.black26,
            isScrollable: true,
      )),
      body: TabBarView(
        children: _children,
        controller: _tabController,
      ),
    );
  }
}
