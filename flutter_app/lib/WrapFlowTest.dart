
import 'package:flutter/material.dart';

class WrapFlowTes extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WrapFlowTes'),
      ),
      body: WrapFlowTesWidget(),
    );
  }
}



class WrapFlowTesWidget extends StatefulWidget {
  @override
  _WrapFlowTesWidgetState createState() => new _WrapFlowTesWidgetState();
}

class _WrapFlowTesWidgetState extends State<WrapFlowTesWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _wedgit2();
  }

  _wedgit1() {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      runSpacing: 20,
      alignment: WrapAlignment.start,
      children: <Widget>[
        new Chip(
          avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text('A'),),
          label: new Text('Haton'),
        ),
        new Chip(
          avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text('M'),),
          label: new Text('LafHaton'),
        ),
        new Chip(
          avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text('H'),),
          label: new Text('MuganHaton'),
        ),
        new Chip(
          avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text('J'),),
          label: new Text('LaensHatonHaton'),
        ),
      ],
    );

  }
  _wedgit2(){
    return Flow(
      delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
      children: <Widget>[
        new Container(width: 80.0, height:80.0, color: Colors.red,),
        new Container(width: 80.0, height:80.0, color: Colors.green,),
        new Container(width: 80.0, height:80.0, color: Colors.blue,),
        new Container(width: 80.0, height:80.0, color: Colors.black,),
        new Container(width: 80.0, height:80.0, color: Colors.yellow,),
        new Container(width: 80.0, height:80.0, color: Colors.brown,),
        new Container(width: 80.0, height:80.0, color: Colors.purple,),
        new Container(width: 80.0, height:80.0, color: Colors.grey,),
      ],
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for(int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
        transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i, transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return  oldDelegate != this;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(double.infinity, 1000.0);
  }


}