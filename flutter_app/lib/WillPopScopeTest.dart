import 'package:flutter/material.dart';

class WillPopScopeTest extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('连续点击返回按钮'),
      ),
      body: WillPopScopeTestWidget(),
    );
  }
}



class WillPopScopeTestWidget extends StatefulWidget {
  @override
  _WillPopScopeTestWidgetState createState() => new _WillPopScopeTestWidgetState();
}

class _WillPopScopeTestWidgetState extends State<WillPopScopeTestWidget> {

  @override
  Widget build(BuildContext context) {
    return _widget1();
  }
  _widget1() {
    DateTime _lastPressedAt; //上次点击时间

    return new WillPopScope(
        child: Container(
          alignment: Alignment.center,
          child: Text('1秒内连续点两次，才进行返回'),
        ),
        onWillPop: ()async{
          if(_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds:1)) {
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        },
    );
  }

}