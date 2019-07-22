import 'package:flutter/material.dart';

class ConstrainedAndSizedBox extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConstrainedAndSizedBox'),
      ),
      body: ConstrainedAndSizedBoxWidget(),
    );
  }
}



class ConstrainedAndSizedBoxWidget extends StatefulWidget {
  @override
  _ConstrainedAndSizedBoxWidgetState createState() => new _ConstrainedAndSizedBoxWidgetState();
}

class _ConstrainedAndSizedBoxWidgetState extends State<ConstrainedAndSizedBoxWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _widget3();
  }
  _widget1() {
    //  ConstrainedBox 设置最小高度、宽度
    // Sizebox设置固定更高度,是对 ConstrainedBox 的封装
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 50.0,// 设置最小高度
        minWidth: double.infinity,
      ),
      child: Container(
        height: 5.0,// 未生效，被父widget 强制修改,    再看看修改成100.0
        child: DecoratedBox(decoration: BoxDecoration(color: Colors.red)),
      ),
    );
  }

  _widget2() {
    // 多重限制,取父子中的较大的值
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 60.0,
        minHeight: 60.0,
      ),
      child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 20.0,
            minWidth: 150.0,
          ),
        child: DecoratedBox(decoration: BoxDecoration(color: Colors.red)),

      ),
    ) ;

  }
  _widget3() {
    // 取消限制
//    UnconstrainedBox对父限制的“去除”并非是真正的去除，
//    上面例子中虽然红色区域大小是90×20，但上方仍然有80的空白空间。
//    也就是说父限制的minHeight(100.0)仍然是生效的，
//    只不过它不影响最终子元素redBox的大小，但仍然还是占有相应的空间，
//    可以认为此时的父ConstrainedBox是作用于子UnconstrainedBox上，
//    而redBox只受子ConstrainedBox限制。
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 60,minHeight: 100),
      child: UnconstrainedBox(

        child: ConstrainedBox(constraints: BoxConstraints(
          minWidth: 90,
          minHeight: 20,
        ),
            child: DecoratedBox(decoration: BoxDecoration(color: Colors.red)),
        ),
      ),
    );
  }

}