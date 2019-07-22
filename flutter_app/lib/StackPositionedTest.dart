import 'package:flutter/material.dart';

class StackPositionedTest extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StackPositionedTest'),
      ),
      body: StackPositionedTestWidget(),
    );
  }
}



class StackPositionedTestWidget extends StatefulWidget {
  @override
  _StackPositionedTestWidgetState createState() => new _StackPositionedTestWidgetState();
}

class _StackPositionedTestWidgetState extends State<StackPositionedTestWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _widget2();
  }

  _widget1() {

    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: Text(
              'Hello world',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          Positioned(
            left: 18.0,
            child: Text('I am jack'),
          ),
          Positioned(
            top: 18.0,
            left: 20.0,
            right: 20.0,
            child: Text('I am oliver'),
          ),
        ],
      ),
    );
  }

  _widget2(){

    return  ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.passthrough,
        children: <Widget>[
          Positioned(
            left: 18.0,
            child: Text('I am Jack'),
          ),
          Container(// 没有定位，就按照fit 的来
            child: Text('Hello world',style:TextStyle(color: Colors.white)),
            color: Colors.red,
          ),
          Positioned(
            top: 19.0,
            child: Text('Your friend'),
          )
        ],
      ),
    );

  }

}