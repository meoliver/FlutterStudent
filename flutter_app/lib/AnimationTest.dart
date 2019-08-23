import 'package:flutter/material.dart';


class AnimationTest extends StatefulWidget {
  @override
  _AnimationTestState createState() => new _AnimationTestState();
}

class _AnimationTestState extends State<AnimationTest >with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(duration: Duration(seconds: 3),vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation)..addListener((){
      setState(() {

      });
    });
    animation.addStatusListener(
        (status){
          if (status == AnimationStatus.completed) {
            //动画执行结束时反向执行动画
            controller.reverse();
          } else if (status == AnimationStatus.dismissed) {
            //动画恢复到初始状态时执行动画（正向）
            controller.forward();
          }
        }
    );
    //启动动画(正向执行)
    controller.forward();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationTest'),
      ),
      body: _widget1(),
    );
  }


  _widget1() {

    return GrowTransition(
      child: Image.asset("images/222.jpg"),
      animation: animation,
    );

//    return new Center(
//        child: Image.asset("images/222.jpg"),
//          width: animation.value,
//          height: animation.value
//      ),
//    );
  }


}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
                height: animation.value,
                width: animation.value,
                child: child
            );
          },
          child: child
      ),
    );
  }
}