
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';


class GestureDetectorTest extends StatefulWidget {
  @override
  _GestureDetectorTestState createState() => new _GestureDetectorTestState();
}

class _GestureDetectorTestState extends State<GestureDetectorTest> {
  String _operation = "No Gesture detected!"; //保存事件名

  double _top = 50.0;     //距顶部的偏移
  double _left = 50.0;    //距左边的偏移
  double _width = 200.0;  //通过修改图片宽度来达到缩放效果

  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false; //变色开关
  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('手势检测（点击、滑动）'),
      ),
      body: _widget6(),
    );
  }

  // 点击、双击、长按
  _widget1() {

    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 200.0,
          height: 200.0,
          child: Text(_operation, style: TextStyle(color: Colors.white),),
        ),
        onTap: ()=>updateText("Tap"),
        onDoubleTap: ()=>updateText("DoubleTap"),
        onLongPress: () => updateText("LongPress"), //长按
      ),
    );
  }

  updateText(String text) {
    setState(() {
      _operation = text;
    });
  }


  // 拖拽
  _widget2() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text('A'),),
            onPanDown: (DragDownDetails e){
              print("用户手指按下：${e.globalPosition}");
            },
            onPanUpdate: (DragUpdateDetails e){
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e) {
              //打印滑动结束时在x、y轴上的速度
              print(e.velocity);
            },
//            //垂直方向拖动事件--
//            onVerticalDragUpdate: (DragUpdateDetails details) {
//              setState(() {
//                _top += details.delta.dy;
//              });
//              },
          ),
        )
      ],
    );
  }

  //缩放
  _widget3() {
    return Center(
      child: GestureDetector(
        //指定宽度，高度自适应
        child: Image.asset("./images/222.jpg", width: _width),
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            print("111111");
            //缩放倍数在0.8到10倍之间
            _width = 200*details.scale.clamp(.8, 10.0);
          });
        },
      ),
    );
  }

  // GestureRecognizer 使用
  // 使用GestureRecognizer后一定要调用其dispose()方法来释放资源（主要是取消内部的计时器）。
  _widget4() {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '你好 世界'
            ),
            TextSpan(
              text: '点我变色',
              style: TextStyle(
                fontSize: 30,
                color: _toggle?Colors.blue:Colors.red,
              ),
              recognizer: _tapGestureRecognizer..onTap=(){
                setState(() {
                  _toggle = !_toggle;
                });
              },
            ),
            TextSpan(
                text: '你好世界'
            ),
          ]
        )
      ),
    );
  }

//  竞争
//  当发生滑动事件时，他们都要在“竞技场”去竞争本次事件的处理权，而最终只有一个“竞争者”会胜出(win)。
//  实际上取决于第一次移动时两个轴上的位移分量，哪个轴的大，哪个轴在本次滑动事件竞争中就胜出。
  _widget5() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            //垂直方向拖动事件
            onVerticalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _top += details.delta.dy;
              });
            },
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _left += details.delta.dx;
              });
            },
          ),
        )
      ],
    );
  }

  // 手势冲突
//  我们发现没有打印"up"，这是因为在拖动时，刚开始按下手指时在没有移动时，拖动手势还没有完整的语义，
// 此时TapDown手势胜出(win)，此时打印"down"，而拖动时，拖动手势会胜出，当手指抬起时，
// onHorizontalDragEnd 和 onTapUp发生了冲突，但是因为是在拖动的语义中，
// 所以onHorizontalDragEnd胜出，所以就会打印 “onHorizontalDragEnd”。
// 如果我们的代码逻辑中，对于手指按下和抬起是强依赖的，比如在一个轮播图组件中，
// 我们希望手指按下时，暂停轮播，而抬起时恢复轮播，但是由于轮播图组件中本身可能已经处理了拖动手势
// （支持手动滑动切换），甚至可能也支持了缩放手势，这时我们如果在外部再用onTapDown、onTapUp来监听的话是不行的。
// 这时我们应该怎么做？其实很简单，通过Listener监听原始指针事件就行：
  _widget6() {
    return Stack(
      children: <Widget>[
        Positioned(
          top:80.0,
          left: _left,
          child: Listener(
            onPointerDown: (details) {
              print("down");
            },
            onPointerUp: (details) {
              //会触发
              print("up");
            },
            child: GestureDetector(
              child: CircleAvatar(child: Text("B")),
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _left += details.delta.dx;
                });
              },
              onHorizontalDragEnd: (details) {
                print("onHorizontalDragEnd");
              },
            ),
          ),
        ),
      ],
    );
  }

}