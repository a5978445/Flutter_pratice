import 'package:flutter/material.dart';
import 'product_cell.dart';


class ProductDetailPage extends StatelessWidget {
  
  ProductInfo product;

  ProductDetailPage(this.product);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(title: Text(product.title),),
      body: new Center(
        child: Text(product.subTitle),
      ),
    );
  }
}