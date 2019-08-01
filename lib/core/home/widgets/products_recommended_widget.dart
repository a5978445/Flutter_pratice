import 'package:flutter/material.dart';
import 'package:ximalaya_demo/core/home/widgets/product_cell.dart';

class ProductsRecommendItemWidget extends StatelessWidget {
  ProductInfo product;
  TapCallBack onTap;

  ProductsRecommendItemWidget(this.product, this.onTap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Container(
      margin: EdgeInsets.only(right: 5),
      child: new GestureDetector(
        onTap: () {
          onTap(product);
        },
        child: new Column(
          children: <Widget>[
            new ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                product.imageName,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Text(product.title),
            Text("${product.listenCount}")
          ],
        ),
      ),
    );
  }
}

class ProductsRecommendWidget extends StatelessWidget {
  List<ProductsRecommendItemWidget> items;
  String title;

  ProductsRecommendWidget(this.items, this.title);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    // TODO: implement build
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title),
        Container(
          width: width,
          height: 140,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: items,
          ),
        )
      ],
    );
  }
}
