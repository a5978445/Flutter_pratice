import 'package:flutter/material.dart';

enum ProductState {
  process, // 正在更新
  done // 已完成

}

typedef TapCallBack = void Function(ProductInfo);

class ProductInfo {
  String imageName;
  String title;
  String subTitle;
  ProductState state; // 作品状态

  int listenCount; // 收听次数
  int episodeNumber; // 作品集数

  ProductInfo(this.imageName, this.title, this.subTitle, this.state,
      this.listenCount, this.episodeNumber);
}

class ProductCellModel {
  ProductInfo product;

  TapCallBack onTap;
  TapCallBack onDelete;

  ProductCellModel(this.product, this.onTap, this.onDelete);
}

class ProductCell extends StatelessWidget {
  ProductCellModel model;

  ProductCell(this.model);

  Widget makeTitleWidget() {
    if (model.product.state == ProductState.process) {
      return new Text(model.product.title);
    } else {
      return RichText(
          text: new TextSpan(
              text: "完 | ",
              style: TextStyle(color: Colors.yellow[600], fontSize: 16),
              children: [
            new TextSpan(
              text: model.product.title,
              style: TextStyle(color: Colors.black, fontSize: 14),
            )
          ]));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;



    return new GestureDetector(
      onTap: () {
        model.onTap(model.product);
      },
      child: new Row(
        children: <Widget>[
          new Image.asset(
            model.product.imageName,
            width: 100,
            height: 100,
          ),


          new Container(
            margin: EdgeInsets.only(right: 0, left: 0),

            height: 100,
            width: width - 124,
            padding: EdgeInsets.only(left: 20, right: 20),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Container(
                  child: makeTitleWidget(),
                  margin: EdgeInsets.only(top: 12, bottom: 4),
                ),
                new Container(
                  child: new Text(model.product.subTitle),
                ),
                new Container(
                  margin: EdgeInsets.only(top: 8),
                  height: 30,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //      mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      //  new Flex(direction: Axis.horizontal,),
                      new Text("${model.product.listenCount}"),
                      new Text("${model.product.episodeNumber}集"),
                      new IconButton(
                          iconSize: 16,
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            model.onDelete(model.product);
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
