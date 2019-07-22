import 'package:flutter/material.dart';
// 滑动控制

class ScrollControllerTest extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: ScrollControllerTestWidget(),
    );
  }
}



class ScrollControllerTestWidget extends StatefulWidget {
  @override
  _ScrollControllerTestWidgetState createState() => new _ScrollControllerTestWidgetState();
}

class _ScrollControllerTestWidgetState extends State<ScrollControllerTestWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _widget1();
  }
  _widget1() {
    return null;
  }

}