import 'package:flutter/material.dart';

class ContainerTest extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ContainerTest'),
      ),
      body: ContainerTestWidget(),
    );
  }
}



class ContainerTestWidget extends StatefulWidget {
  @override
  _ContainerTestWidgetState createState() => new _ContainerTestWidgetState();
}

class _ContainerTestWidgetState extends State<ContainerTestWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _widget1();
  }
  _widget1() {
    return Container(
      margin: EdgeInsets.only(top: 50.0, left: 120.0),
      constraints: BoxConstraints.tightFor(width: 200, height: 150),
      decoration: BoxDecoration(
        gradient: RadialGradient(
            colors: [
              Colors.red,
              Colors.orange,
            ],
          center: Alignment.topLeft,
          radius: .98
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(2.0, 2.0),
            blurRadius: 4.0
          ),
        ]
      ),
      transform: Matrix4.rotationZ(0.2),
      alignment: Alignment.center,
      child: Text('5.20',style:TextStyle(color: Colors.white, fontSize: 40.0),),
    );
  }

}