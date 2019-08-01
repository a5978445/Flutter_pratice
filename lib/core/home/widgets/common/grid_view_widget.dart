import 'package:flutter/material.dart';


typedef GridViewBuild = GridView Function(BuildContext);

// 由于GridTile 视图效果不满足需求，所以自定义GridViewWidget
class GridViewWidget extends StatelessWidget {


   Widget header;
   Widget footer;
  final  GridViewBuild gridViewBuild;

  GridViewWidget(this.gridViewBuild, {Key key, this.header, this.footer}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> children = List<Widget>();
    if(header != null) {
      children.add(header);
    }

    children.add(gridViewBuild(context));

    if(footer != null) {
      children.add(footer);
    }

    // TODO: implement build
    return new Column(
      children: children,
    );
  }
}

