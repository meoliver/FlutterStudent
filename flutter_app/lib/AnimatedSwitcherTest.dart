import 'package:flutter/material.dart';


class AnimatedSwitcherTest extends StatefulWidget {
  @override
  _AnimatedSwitcherTestState createState() => new _AnimatedSwitcherTestState();
}

class _AnimatedSwitcherTestState extends State<AnimatedSwitcherTest> {

  int _count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedSwitcherTest'),
      ),
      body: _widget2(),
    );
  }
  _widget1() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation){
                return ScaleTransition(scale: animation, child: child,);
            },
            child: Text(
              '$_count',
              key: ValueKey(_count),
              style: Theme.of(context).textTheme.display1,// 就是字体大小
            ),
          ),
          RaisedButton(
            child: const Text('+1'),
            onPressed: (){
              setState(() {
                _count += 1;
              });
            },
          )
        ],
      ),
    );
  }

  _widget2(){

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation){
              var tween = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));

              return MySlideTransition(
                child: child,
                position: tween.animate(animation),
              );
            },
            child: Text(
              '$_count',
              key: ValueKey(_count),
              style: Theme.of(context).textTheme.display1,// 就是字体大小
            ),
          ),
          RaisedButton(
            child: const Text('+1'),
            onPressed: (){
              setState(() {
                _count += 1;
              });
            },
          )
        ],
      ),
    );
  }
}

class MySlideTransition extends AnimatedWidget {

  MySlideTransition({
    Key key,
    @required Animation<Offset> position,
    this.transformHitTests = true,
    this.child,
  }) : assert(position != null),
        super(key: key, listenable: position);

  Animation<Offset> get position => listenable;
  final bool transformHitTests;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Offset offset = position.value;
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }

    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }

}
