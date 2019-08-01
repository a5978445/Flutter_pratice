import 'package:flutter/material.dart';
import 'package:ximalaya_demo/const_sets.dart';

class AdvertisingBoardLabelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
    ]);
  }
}
