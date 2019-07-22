import 'package:flutter/material.dart';

class atest extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: atestWidget(),
    );
  }
}



class atestWidget extends StatefulWidget {
  @override
  _atestWidgetState createState() => new _atestWidgetState();
}

class _atestWidgetState extends State<atestWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _widget1();
  }
  _widget1() {
    return null;
  }

}