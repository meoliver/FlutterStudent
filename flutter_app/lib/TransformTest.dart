
import 'package:flutter/material.dart';
import 'dart:math'as math;

class TransformTest extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransformTest'),
      ),
      body: TransformTestWidget(),
    );
  }
}



class TransformTestWidget extends StatefulWidget {
  @override
  _TransformTestWidgetState createState() => new _TransformTestWidgetState();
}

class _TransformTestWidgetState extends State<TransformTestWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _widget1();
  }
  _widget1() {
    return  Container (
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50),
          ),
          Container(//沿Y轴倾斜0.3弧度
            color: Colors.black,
            child: new Transform(
              transform: new Matrix4.skewY(0.3),
              alignment: Alignment.topRight,
              child: new Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.deepOrange,
                child: const Text('Apartment for rent!'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
          ),
          DecoratedBox(//旋转90度
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.rotate(
              angle: math.pi/2,
              child: Text('Hello world'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.translate(offset: Offset(-20, -5.0), child: Text('translate')),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.scale(scale: 1.5,child: Text('scale'),),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
          ),
          Row(
            //Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，所以无论对子widget应用何种变化，
            //其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的。下面我们具体说明：
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: Transform.scale(scale: 1.5,child: Text('在屏幕上的位置都是固定不变的'),),
              ),
              Text('你好',style: TextStyle(color: Colors.green,fontSize: 18.0),),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                //旋转90度
                decoration: BoxDecoration(color: Colors.red),
                //RotatedBox和Transform.rotate功能相似，
                // 它们都可以对子widget进行旋转变换，
                // 但是有一点不同：RotatedBox的变换是在layout阶段，会影响在子widget的位置和大小
                child: RotatedBox(child:Text('旋转')  ,quarterTurns: 1,),
              ),
              Text('hello world', style: TextStyle(color: Colors.green, fontSize: 18.0)),
            ],
          ),
        ],
      ),
    );

  }

}