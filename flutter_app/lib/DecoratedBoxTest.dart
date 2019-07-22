
import 'package:flutter/material.dart';

class DecoratedBoxTest extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DecoratedBoxTest'),
      ),
      body: DecoratedBoxTestWidget(),
    );
  }
}



class DecoratedBoxTestWidget extends StatefulWidget {
  @override
  _DecoratedBoxTestWidgetState createState() => new _DecoratedBoxTestWidgetState();
}

class _DecoratedBoxTestWidgetState extends State<DecoratedBoxTestWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _widget1();
  }
  _widget1() {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.red, Colors.orange[700]]),// 渐变
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(2.0, 2.0),
            blurRadius:4.0,
          ),
        ]
      ),
      child: Padding(
        padding:EdgeInsets.symmetric(horizontal: 40,vertical: 20),
        child: Text('Login',style:TextStyle(color:Colors.red),),
      ),
    );
  }

}

// BoxDecoration 的 属性
//Color color, //颜色
//    DecorationImage image,//图片
//BoxBorder border, //边框
//    BorderRadiusGeometry borderRadius, //圆角
//List<BoxShadow> boxShadow, //阴影,可以指定多个
//    Gradient gradient, //渐变
//BlendMode backgroundBlendMode, //背景混合模式
//    BoxShape shape = BoxShape.rectangle, //形状