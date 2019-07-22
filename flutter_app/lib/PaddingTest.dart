import 'package:flutter/material.dart';

class PaddingTest extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaddingTest'),
      ),
      body: PaddingTestWidget(),
    );
  }
}



class PaddingTestWidget extends StatefulWidget {
  @override
  _PaddingTestWidgetState createState() => new _PaddingTestWidgetState();
}

class _PaddingTestWidgetState extends State<PaddingTestWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _widget1();
  }
  _widget1() {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(//左边添加8像素补白
            padding: const EdgeInsets.only(left: 8.0),
            child: Text('Hello world'),
          ),
          Padding(
            //上下各添加8像素补白
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text("I am oliver"),
          ),
          Padding(
            // 分别指定四个方向的补白
            padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,20.0),
            child: Text("Your friend"),
          ),
        ],
      ),
    );
  }

}