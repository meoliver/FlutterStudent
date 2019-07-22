
import 'package:flutter/material.dart';

class RowColumn extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('row column'),
      ),
      body: RowColumnTest(),
    );
  }
}

class  RowColumnTest extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _rowColumnTestState();
  }
}

class _rowColumnTestState extends State<RowColumnTest> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _wedget3();
  }

  _wedget1() {
    return Column(
      textDirection: TextDirection.ltr,// 从左开始
      mainAxisSize: MainAxisSize.max,// 占满
//      mainAxisAlignment: MainAxisAlignment.center,
      verticalDirection: VerticalDirection.down,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("hello world"),
            Text("I am oliver"),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("hello world"),
            Text("I am oliver"),
          ],
        ),
        Row(
          mainAxisAlignment:MainAxisAlignment.end,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Text("hello world"),
            Text("I am oliver"),
          ],

        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            Text("hello world", style: TextStyle(fontSize: 40),),
            Text("I am oliver"),
          ],
        ),
      ],

    );
  }
  _wedget2() {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
          children: <Widget>[
            Container(
              color: Colors.red,
              child: Column(
                mainAxisSize: MainAxisSize.max,//无效，内层Colum高度为实际高度
                children: <Widget>[
                  Text("hello world "),
                  Text("I am Jack "),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  _wedget3() {
    return  Column (
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, //垂直方向居中对齐
              children: <Widget>[
                Text("hello world "),
                Text("I am Jack "),
              ],
            ),
          ),
        )
      ],
    );
  }
}