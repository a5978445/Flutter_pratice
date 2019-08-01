import 'package:flutter/material.dart';
import 'package:banner_view/banner_view.dart';
import 'const_sets.dart';

const String ruoYeZhiQiuDescription = """
角色名: 若叶知秋 ----> 牧神女婿
死因: 新婚之夜被岳父所杀，死前仍拼命爬行，渴望抓住掉在地上的绣球
""";
const String linRuoMeiDescription = """
角色名 凛若梅 -----> 牧神女儿
死因: 被父亲亲手释放的罪犯所杀
""";
const String muShendDescription = """
角色名: 牧神
死因: 被老婆和老婆情人合著之剑所伤，众叛亲离而亡
""";
const String qiSeLinDescription = """
角色名 七色翎 ----> 牧神妻子
死因: 厌倦了这场包办婚姻而出家，在他人劝说下与情人合伙铸造弑神之剑，以身献祭铸剑而亡
""";

class AppraiseItem extends StatelessWidget {
  final String title;
  final String imageName;

  AppraiseItem(this.title, this.imageName);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(children: [
      new Expanded(child: Image.asset(imageName)),
      new Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        alignment: Alignment.topLeft,
        height: 140,
        child: new Text(
          title,
          textDirection: TextDirection.ltr,
        ),
      )
    ]);
  }
}

class AppraisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("究竟哪个让你落泪"),
      ),
      body: new BannerView(
        [
          AppraiseItem(ruoYeZhiQiuDescription, ruoYeZhiQiuIconString),
          AppraiseItem(linRuoMeiDescription, linRuoMeiIconString),
          AppraiseItem(muShendDescription, muShenIconString),
          AppraiseItem(qiSeLinDescription, qiSeLingIconString),
          VotePage()
        ],
        autoRolling: false,
        cycleRolling: false,
      ),
    );
  }
}

class VotePage extends StatefulWidget {
  @override
  _VotePageState createState() {
    // TODO: implement createState
    return _VotePageState();
  }
}

class _VotePageState extends State<VotePage> {
  List<bool> _selectState;

  @override
  initState() {
    super.initState();
    _selectState = [false, false, false, false];
  }

  void changeSelectState(bool state, int index) {
    assert(index < _selectState.length);

    _selectState = _selectState.map((value) => false).toList();

    setState(() {
      print(_selectState);
      _selectState[index] = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        new Text("那个最惨我不知道，但这一家子加起来肯定是最惨的，那么究竟谁最惨呢？ 请投票！！！"),
        new CheckboxListTile(
          value: _selectState[0],
          onChanged: (select) {
            changeSelectState(select, 0);
          },
          title: Text("若叶知秋"),
        ),
        new CheckboxListTile(
          value: _selectState[1],
          onChanged: (select) {
            changeSelectState(select, 1);
          },
          title: Text("凛若梅"),
        ),
        new CheckboxListTile(
          value: _selectState[2],
          onChanged: (select) {
            changeSelectState(select, 2);
          },
          title: Text("牧神"),
        ),
        new CheckboxListTile(
          value: _selectState[3],
          onChanged: (select) {
            changeSelectState(select, 3);
          },
          title: Text("七色翎"),
        ),
        new Padding(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: new RaisedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  child:

                  Dialog(
                    child:   new Container(
                      height: 140,
                      alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 20, bottom: 20),

                        child: new Column(
                          children: <Widget>[
                            new Text("感谢您的投票",style: TextStyle(
                                inherit: false,
                                color: Colors.red,
                                fontSize: 14),),
                            new RaisedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: new Text(
                                  "确定",

                                ))
                          ],
                        ),

                    ),
                  )


                );
              },
              child: new Text("确定")),
        )
      ],
    );
  }
}
