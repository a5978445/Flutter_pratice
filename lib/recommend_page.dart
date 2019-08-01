import 'package:flutter/material.dart';
import 'package:banner_view/banner_view.dart';
import 'personal_category_page.dart';
import 'const_sets.dart';
import 'product_cell.dart';
import 'products_recommended_widget.dart';
import 'product_detail_page.dart';
import 'dart:math';
import 'dart:async';

class TabBuild {
  final String _title;
  final Icon _icon;

  TabBuild(this._title, this._icon);

  Tab asTab() => Tab(
        text: _title,
        icon: _icon,
      );
}

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

class ReCommendPage extends StatefulWidget {
  @override
  _ReCommendPageState createState() {
    // TODO: implement createState
    return _ReCommendPageState();
  }
}

class _ReCommendPageState extends State<ReCommendPage>
    with TickerProviderStateMixin {
  TabController _tabController;
  AnimationController _refreshAnimationController;

  List<Tab> _tabs;
  List<Widget> _chiren;
  List<Widget> _recommendItems;
  List<ProductInfo> _products;
  List<Widget> _productWidgets;
  ProductsRecommendWidget _productsRecommendWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 经典必听，每日必听，私人FM,精品，小雅新品
    _tabs = [
      TabBuild("经典必听", Icon(Icons.widgets)),
      TabBuild("每日必听", Icon(Icons.print)),
      TabBuild("私人FM", Icon(Icons.landscape)),
      TabBuild("精品", Icon(Icons.mail)),
      TabBuild("小雅新品", Icon(Icons.headset)),
    ].map((build) => build.asTab()).toList();
    _chiren = [
      PersonalCategoryPage(),
      PersonalCategoryPage(),
      PersonalCategoryPage(),
      PersonalCategoryPage(),
      PersonalCategoryPage(),
    ];

    _recommendItems = [
      GirdViewItem("倦收天", juanShouTianIconString),
      GirdViewItem("魄如霜", poRushuangIconString),
      GirdViewItem("原无乡", yuanWuXiangIconString),
      GirdViewItem("慕峥嵘", muZhengRongIconString),
      GirdViewItem("北芳秀", beiFangXiuIconString),
      GirdViewItem("罪负英雄", zuiFuYingXiongIconString),
    ];

    _tabController = TabController(length: _tabs.length, vsync: this);

    _products = [
      ProductInfo(juanShouTianIconString, "倦收天", "常驻曙山之巅", ProductState.done,
          100000, 99),
      ProductInfo(juanShouTianIconString, "倦收天", "常驻曙山之巅", ProductState.process,
          100000, 99),
      ProductInfo(juanShouTianIconString, "倦收天", "常驻曙山之巅", ProductState.done,
          100000, 99),
      ProductInfo(juanShouTianIconString, "倦收天", "常驻曙山之巅", ProductState.process,
          100000, 99),
    ];

    _productWidgets = makeProductWidgets();

    _productsRecommendWidget = ProductsRecommendWidget(
        [
          ProductInfo(juanShouTianIconString, "倦收天", "常驻曙山之巅",
              ProductState.done, 100000, 99),
          ProductInfo(juanShouTianIconString, "原无乡", "常驻曙山之巅",
              ProductState.done, 100000, 99),
          ProductInfo(juanShouTianIconString, "魄如霜", "常驻曙山之巅",
              ProductState.process, 100000, 99),
          ProductInfo(juanShouTianIconString, "倦收天", "常驻曙山之巅",
              ProductState.process, 100000, 99),
          ProductInfo(juanShouTianIconString, "倦收天", "常驻曙山之巅",
              ProductState.done, 100000, 99),
          ProductInfo(juanShouTianIconString, "倦收天", "常驻曙山之巅",
              ProductState.done, 100000, 99),
        ]
            .map((product) => ProductsRecommendItemWidget(product, (product) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ProductDetailPage(product);
                  }));
                }))
            .toList(),
        "精品");

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


  List<Widget> makeProductWidgets() {
    return _products
        .map((product) => ProductCellModel(product, (product) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ProductDetailPage(product);
              }));
            }, (product) {
              removeProduct(product);
            }))
        .map((productModel) => ProductCell(productModel))
        .toList();
  }

  void removeProduct(ProductInfo product) {
    setState(() {
      _products.remove(product);
      _productWidgets = makeProductWidgets();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: EdgeInsets.only(left: 12, right: 12),
      child: new ListView(
        children: <Widget>[
          // 搜索栏

          new Row(mainAxisAlignment: MainAxisAlignment.start, children: <
              Widget>[
            new Expanded(
              child: new Container(
                padding: EdgeInsets.all(8),
                height: 44,
                child: new TextField(
                  decoration: InputDecoration(
                      labelText: "读者",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              flex: 6,
            ),
            new Expanded(
              child: new IconButton(icon: Icon(Icons.timer), onPressed: () {}),
              flex: 1,
            ),
            new Expanded(
              child: new IconButton(icon: Icon(Icons.add), onPressed: () {}),
              flex: 1,
            ),
          ]),
          // Banner View

          new Container(
            alignment: Alignment.center,
            height: 200.0,
            child: new BannerView(
              [
                "lib/resource/xuanbin.jpeg",
                "lib/resource/xuantong.jpeg",
                "lib/resource/xuanmie.jpeg",
                "lib/resource/xuanxiao.jpeg",
              ].map((imageName) => Image.asset(imageName)).toList(),
              intervalDuration: Duration(seconds: 2),
            ),
          ),
          // 推荐分类

          new TabBar(
            tabs: _tabs,
            controller: _tabController,
            onTap: (selectIndex) {
              Navigator.pushNamed(context, personalCategoryPageIdentify);
            },
            labelColor: Colors.grey,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontSize: 12),
            indicatorColor: Colors.transparent,
          ),

          new Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            new Text(
              "听头条",
              style: TextStyle(color: Colors.red, fontSize: 17),
            ),
            new GestureDetector(
              child: new Text("霹雳侠影到底哪位角色死的最惨"),
              onTap: () {
                Navigator.pushNamed(context, appraisePageIdentify);
              },
            ),
            new FlatButton(
                onPressed: () {
                  print("tap more action button");
                },
                child: new Text("更多"))
          ]),

          iosStyleRecommendItems(),
          new Column(
            children: _productWidgets,
          ),
          _productsRecommendWidget,
        ],
      ),
    );
  }

  Widget iosStyleRecommendItems() {
    return new Column(
      children: [
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text("猜你喜欢"),
            new FlatButton(
                onPressed: () {
                  print("tap more action button");
                },
                child: new Text("更多")),
          ],
        ),
        new GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 5,
            children: _recommendItems,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            addRepaintBoundaries: false),
        new Center(
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
            )
      ],
    );
  }

  Widget suspensionRecommendItems() {
    // 这个模式是悬浮窗，和IOS的风格不一样

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

  void changeRecommendItems() {
    setState(() {
      _recommendItems = _recommendItems.reversed.toList();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }
}
