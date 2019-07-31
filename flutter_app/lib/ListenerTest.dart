import 'package:flutter/material.dart';


class ListenerTest extends StatefulWidget {
  @override
  _ListenerTestState createState() => new _ListenerTestState();
}

class _ListenerTestState extends State<ListenerTest> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ListenerTest'),
      ),
      body: _widget4(),
    );
  }
  _widget1() {


    return Listener(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width:double.infinity,
        height:200.0,
        child: Text(_event?.toString()??"",style: TextStyle(color: Colors.white),),
      ),
      onPointerDown: (PointerDownEvent event){ setState(() {
        _event = event;
      });},
      onPointerMove: (PointerMoveEvent event){ setState(() {
        _event = event;
      });},
      onPointerUp: (PointerUpEvent event){ setState(() {
        _event = event;
      });},
    );
  }

  _widget2(){
    return Listener(
      child: ConstrainedBox(
        constraints: BoxConstraints.tight(Size(300, 150)),
        child: Center(child: Text('Box A'),),
      ),
      onPointerDown: (event)=> print('down A'),
//      behavior: HitTestBehavior.opaque,

    );
  }

  _widget3() {
    return Stack(
      children: <Widget>[
        Listener(
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(Size(300.0, 200.0)),
            child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.blue)),
          ),
          onPointerDown: (event) => print("down0"),
        ),
        Listener(
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(Size(200.0, 100.0)),
            child: Center(child: Text("左上角200*100范围内非文本区域点击"),),
          ),
          onPointerDown: (event) => print("down1"),
          behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
        )
      ],
    );
  }

  _widget4() {
    return Listener(
      child: AbsorbPointer(
        child: Listener(
          child: Container(
            color: Colors.red,
            width: 200.0,
            height: 100.0,
          ),
          onPointerDown: (event)=>print("in"),
        ),
      ),
      onPointerDown: (event)=>print("up"),
    );
  ;
  }

}