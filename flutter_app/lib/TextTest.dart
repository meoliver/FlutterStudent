
import 'package:flutter/material.dart';
//https://book.flutterchina.club/chapter3/text.html
class TextTest extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: TextSpanText(),
    );
  }
}

// text 设置一些属性
class Textttt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      'Hello world1Hello world2Hello world3Hello world4Hello world5Hello world6',
      style: TextStyle(
          color: Colors.blue,
          fontSize: 18.0,
          height: 1.2,
          fontFamily: "Courier",
          background: new Paint()..color=Colors.yellow,
          decoration:TextDecoration.underline,
          decorationStyle: TextDecorationStyle.dashed
      ),
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textScaleFactor: 1.5,
    );
  }

}

// 富文本
class TextSpanText extends StatelessWidget {
  _tapRecognizer() {
    print("点击链接了");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text.rich(TextSpan(
        children: [
          TextSpan(
              text: "Home: ",
              style: TextStyle(
                fontSize:  25
              )
          ),
          TextSpan(
              text: "https://flutterchina.club",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25,
              ),
              recognizer: _tapRecognizer()
          ),
        ]
    ));
  }
}
