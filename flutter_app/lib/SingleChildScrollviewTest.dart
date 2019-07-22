import 'package:flutter/material.dart';

class SingleChildScrollviewTest extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollviewTest'),
      ),
      body: SingleChildScrollviewTestWidget(),
    );
  }
}


//需要注意的是，通常SingleChildScrollView只应在期望内容适合屏幕的情况下使用，
//它无法使用基于Sliver的延迟实例化，如果预计视口通常包含超出屏幕尺寸的内容，
// 那么SingleChildScrollView将会非常昂贵。
class SingleChildScrollviewTestWidget extends StatefulWidget {
  @override
  _SingleChildScrollviewTestWidgetState createState() => new _SingleChildScrollviewTestWidgetState();
}

class _SingleChildScrollviewTestWidgetState extends State<SingleChildScrollviewTestWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _widget1();
  }

  _widget1() {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: str.split("").map((c)=>Text(c,textScaleFactor: 2.0,)).toList()
          ),
        ),
      ),
    );
  }

}