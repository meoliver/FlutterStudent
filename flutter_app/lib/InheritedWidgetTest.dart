
import 'package:flutter/material.dart';

class InheritedWidgetTest extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: InheritedWidgetTestWidget(),
    );
  }
}



class InheritedWidgetTestWidget extends StatefulWidget {
  @override
  _InheritedWidgetTestWidgetState createState() => new _InheritedWidgetTestWidgetState();
}

class _InheritedWidgetTestWidgetState extends State<InheritedWidgetTestWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _widget1();
  }
  _widget1() {
    return null;
  }

}