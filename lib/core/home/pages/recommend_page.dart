import 'package:flutter/material.dart';
import 'package:banner_view/banner_view.dart';
import 'package:ximalaya_demo/core/home/pages/personal_category_page.dart';
import 'package:ximalaya_demo/const_sets.dart';
import 'package:ximalaya_demo/core/home/widgets/product_cell.dart';
import 'package:ximalaya_demo/core/home/widgets/products_recommended_widget.dart';
import 'package:ximalaya_demo/core/home/pages/product_detail_page.dart';
import 'dart:math';
import 'dart:async';
import 'package:ximalaya_demo/core/home/widgets/advertising_board_label_widget.dart';
import 'package:ximalaya_demo/core/home/widgets/product_grid_view.dart';

class TabItem extends StatelessWidget {
  final String _title;
  final Icon _icon;
  final VoidCallback _onTap;

  TabItem(this._title, this._icon, this._onTap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _icon,
          new Text(_title),
        ],
      ),
    );
  }
}

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() {
    // TODO: implement createState
    return _RecommendPageState();
  }
}

class _RecommendPageState extends State<RecommendPage> {
  List<Widget> _categoryItems;

  List<ProductInfo> _products;
  List<Widget> _productWidgets;
  ProductsRecommendWidget _productsRecommendWidget;

  List<Widget> _bannerWidgets; // 广告栏展示

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 经典必听，每日必听，私人FM,精品，小雅新品
    _categoryItems = [
      TabItem("经典必听", Icon(Icons.widgets), () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return PersonalCategoryPage();
        }));
      }),
      TabItem("每日必听", Icon(Icons.print), () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return PersonalCategoryPage();
        }));
      }),
      TabItem("私人FM", Icon(Icons.landscape), () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return PersonalCategoryPage();
        }));
      }),
      TabItem("精品", Icon(Icons.mail), () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return PersonalCategoryPage();
        }));
      }),
      TabItem("小雅新品", Icon(Icons.headset), () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return PersonalCategoryPage();
        }));
      }),
    ];

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

    _bannerWidgets = [
      "lib/resource/xuanbin.jpeg",
      "lib/resource/xuantong.jpeg",
      "lib/resource/xuanmie.jpeg",
      "lib/resource/xuanxiao.jpeg",
    ].map((imageName) => Image.asset(imageName)).toList();
  }

  List<Widget> makeProductWidgets() {
    return _products
        .map((product) => ProductCell(product, (product) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ProductDetailPage(product);
              }));
            }, (product) {
              removeProduct(product);
            }))
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

          // 广告栏
          new Container(
            alignment: Alignment.center,
            height: 200.0,
            child: new BannerView(
              _bannerWidgets,
              intervalDuration: Duration(seconds: 2),
            ),
          ),

          // 常用分类
          new Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: new Row(
              children: _categoryItems,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),

          //  advertising board label Widget

          // 横条广告
          AdvertisingBoardLabelWidget(),

          //  个性推荐
          ProductGridViewWidget(),

          // 系统推荐
          new Column(
            children: _productWidgets,
          ),

          // 精品推荐
          _productsRecommendWidget,
        ],
      ),
    );
  }
}
