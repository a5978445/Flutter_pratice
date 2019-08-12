import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() {
    // TODO: implement createState
    return _MyPageState();
  }
}

class _MyPageState extends State<MyPage> {
  bool isOpenMinorProtectionMode;

  List<List<String>> source = [
    ["我的积分", "我的圈子", "知识大使", "我的收听偏好"],
    ["扫一扫", "未成年人保护模式", "夜间模式"],
    ["金融专区", "运营商服务", "商场", "推荐喜玛拉雅给好友", "帮助与反馈"],
  ];

  // 正常情况下，Widget应该由数据源，这里直接硬编码
  List<List<Widget>> cellWidgets;
  List<Widget> listTiles;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isOpenMinorProtectionMode = true;

    updateCellWidgets();

    listTiles = makeListTiles();
  }

  void updateCellWidgets() {
    cellWidgets = [
      [
        ListTile(
          leading: Text("我的积分"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "1010分",
                style: TextStyle(color: Colors.red),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        ListTile(
          leading: Text("我的圈子"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.brightness_1,
                color: Colors.red,
                size: 8,
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        ListTile(
          leading: Text("知识大使"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Text("我的收听偏好"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
      [
        ListTile(
          leading: Text("扫一扫"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Text("未成年人保护模式"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "未成年人模式",
                style: TextStyle(color: Colors.red),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        ListTile(
          leading: Text("夜间模式"),
          trailing: Switch(
              value: isOpenMinorProtectionMode,
              onChanged: (isTrue) {
                print("onChanged: $isTrue");
                print(isOpenMinorProtectionMode);
                isOpenMinorProtectionMode = isTrue;
                setState(() {
                  updateCellWidgets();
                  listTiles = makeListTiles();
                });
              },
              activeColor: Colors.green),
        ),
      ],
      [
        ListTile(
          leading: Text("金融专区"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Text("运营商服务"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Text("商场"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "小雅Nano首发",
                style: TextStyle(color: Colors.red),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        ListTile(
          leading: Text("推荐喜玛拉雅给好友"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "领二十元优惠券",
                style: TextStyle(color: Colors.red),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        ListTile(
          leading: Text("帮助与反馈"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
    ];
  }

  List<Widget> makeListTiles() {
    List<Widget> columns = List<Widget>();

    columns.add(Container(
      //  width: 420,
      height: 140,
      //    color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(left: 16),
            child:  ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: new Image.asset(
                "lib/resource/倦收天.jpeg",
                scale: 3.0,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          )
          ,

          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("最是光阴化浮沫"),
                  Text("探花"),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("粉丝 4"),
                  Text("关注 35"),
                ],
              ),
              FlatButton(
                onPressed: () {},
                child: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("已听116小时"),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            height: 52,

            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.score),
                SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("积分福利"),
                    Text("等你来领"),
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 251, 228, 223),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26),
                  bottomLeft: Radius.circular(26)),
            ),
          ),
        ],
      ),
    ));

    columns.add(new ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.video_label),
          Text("VIP会员"),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("会员首月仅6元"),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    ));

    columns.add(new Container(
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.all(4),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Column(
            children: <Widget>[Text("2"), SizedBox(height: 8), Text("已购")],
          ),
          new Column(
            children: <Widget>[Text("1"), SizedBox(height: 8), Text("优惠券")],
          ),
          new Column(
            children: <Widget>[Text("0"), SizedBox(height: 8), Text("直播喜钻")],
          ),
          new Column(
            children: <Widget>[Text("59"), SizedBox(height: 8), Text("喜点")],
          ),
          new Column(
            children: <Widget>[
              Icon(Icons.monetization_on),
              SizedBox(height: 8),
              Text("我的钱包")
            ],
          )
        ],
      ),
      decoration: new ShapeDecoration(

          // 统一四边颜色和宽度
          shape: Border.all(
              color: Color(0xFF00FFFF), style: BorderStyle.solid, width: 2)),
    ));

    columns.add(new Container(
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.all(4),
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  Icon(Icons.record_voice_over),
                  SizedBox(height: 8),
                  Text("我要录音")
                ],
              ),
              new Column(
                children: <Widget>[
                  Icon(Icons.accessible),
                  SizedBox(height: 8),
                  Text("我要直播")
                ],
              ),
              new Column(
                children: <Widget>[
                  Icon(Icons.access_alarm),
                  SizedBox(height: 8),
                  Text("我的作品")
                ],
              ),
              new Column(
                children: <Widget>[
                  Icon(Icons.ac_unit),
                  SizedBox(height: 8),
                  Text("主播工作台")
                ],
              ),
            ],
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            leading: Text("如何让你每条声音都赚钱?! 速戳>>"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      decoration: new ShapeDecoration(

          // 统一四边颜色和宽度
          shape: Border.all(
              color: Color(0xFF00FFFF), style: BorderStyle.solid, width: 2)),
    ));

    cellWidgets.forEach((widgets) {
      var divideTiles =
          ListTile.divideTiles(tiles: widgets, color: Colors.grey);
      divideTiles.forEach((widget) {
        columns.add(widget);
      });

      var footer = Container(
        height: 8,
        color: Color.fromARGB(255, 243, 244, 246),
      );
      columns.add(footer);
    });

    return columns;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //  BoxDecoration
    print(" BuildContext ");
    /*
    var widgetsArray =
//        source.map((widgets) => widgets.map((text) => TableViewCell(
//              leading: Text(text),
//              trailing: Icon(Icons.arrow_forward),
//            )));

        // [[String]] => [[ListTile]]
        source.map((widgets) => widgets.map((text) => ListTile(
              leading: Text(text),
              trailing: Icon(Icons.arrow_forward_ios),
            )));
*/
    // [[ListTile]] => [divideTiles]

    listTiles = makeListTiles();

    return new Scaffold(
      appBar: AppBar(
        title: Text("我"),
      ),
      body: new ListView.builder(
        itemBuilder: (context, index) {
          return listTiles[index];
        },
        itemCount: listTiles.length,
      ),
    );
  }
}
