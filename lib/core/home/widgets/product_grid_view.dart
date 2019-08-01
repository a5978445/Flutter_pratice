import 'package:flutter/material.dart';
import 'dart:async';
import 'package:ximalaya_demo/const_sets.dart';
import 'dart:math';
import 'common/grid_view_widget.dart';

class GirdViewItem extends StatelessWidget {
  final String title;
  final String imageName;

  GirdViewItem(this.title, this.imageName);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        new Image.asset(
          imageName,
          height: 100,
        ),
        new Text(title)
      ],
    );
  }
}

/*
*  从页面逻辑来看，这个模块是相对独立的
*  它的数据来源于某条独立的API
*  因此的它的状态，由它自己管理，而不是由父控件进行管理
*
* */
class ProductGridViewWidget extends StatefulWidget {
  @override
  _ProductGridViewWidgetState createState() {
    // TODO: implement createState
    return _ProductGridViewWidgetState();
  }
}

class _ProductGridViewWidgetState extends State<ProductGridViewWidget> with SingleTickerProviderStateMixin {

  AnimationController _refreshAnimationController;
  List<Widget> _recommendItems;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _recommendItems = [
      GirdViewItem("倦收天", juanShouTianIconString),
      GirdViewItem("魄如霜", poRushuangIconString),
      GirdViewItem("原无乡", yuanWuXiangIconString),
      GirdViewItem("慕峥嵘", muZhengRongIconString),
      GirdViewItem("北芳秀", beiFangXiuIconString),
      GirdViewItem("罪负英雄", zuiFuYingXiongIconString),
    ];

    _refreshAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _refreshAnimationController.addListener(() {
      setState(() {});
    });
  }

  void startRefresh() async {
    _refreshAnimationController.forward();
  }

  void changeRefreshState() {
    startRefresh();
    new Timer(Duration(seconds: 1), () {
      _refreshAnimationController.reset();
      changeRecommendItems();
    });
  }


  void changeRecommendItems() {
    setState(() {
      _recommendItems = _recommendItems.reversed.toList();
    });
  }


  @override
  Widget build(BuildContext context) {

    return new GridViewWidget((context){

     return new GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 5,
          children: _recommendItems,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          addRepaintBoundaries: false);

    },

    header: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Text("猜你喜欢"),
        new FlatButton(
            onPressed: () {
              print("tap more action button");
            },
            child: new Text("更多")),
      ],
    ) ,
      footer:  new Center(
          child: new FlatButton.icon(
            onPressed: changeRefreshState,
            icon: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateZ(_refreshAnimationController.value * pi * 2),
              child: Icon(Icons.refresh),
            ),
            label: Text("换一换"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side: BorderSide(color: Colors.red, width: 1.0)),
          ) //new Text("刷新"),
      ),
    );

  }


/*

     Widget suspensionRecommendItems() {
    // 这个模式是悬浮窗，和IOS的风格不一样,header 和 footer 会和 GridView重叠

    return new Container(
      height: 600,
      child: new GridTile(
        child: new GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 5,
          children: _recommendItems,
          shrinkWrap: true,
          addRepaintBoundaries: false,
          physics: NeverScrollableScrollPhysics(),
          primary: false,
        ),
        footer: new Container(
          color: Colors.brown,
          height: 44,
        ),
        header: new GridTileBar(
          leading: new Text("猜你喜欢"),
          trailing: new FlatButton(
              onPressed: () {
                print("tap more action button");
              },
              child: new Text("更多")),
        ),
      ),
    );
  }

   */
}