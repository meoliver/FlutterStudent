
import 'package:flutter/material.dart';

//本示例是对单个路由换肤，如果相对整个应用换肤，可以去修改MaterialApp的theme属性。



class ThemeTest extends StatefulWidget {

  @override
  _ThemeTestWidgetState createState() => new _ThemeTestWidgetState();
}

class _ThemeTestWidgetState extends State<ThemeTest> {
  Color _themeColor = Colors.teal; //当前路由主题色

  @override
  Widget build(BuildContext context) {
    return _widget1();
  }
  _widget1() {
    ThemeData themeData = Theme.of(context);

    return Theme(
      data: ThemeData(
        primarySwatch: _themeColor,
        iconTheme: IconThemeData(color: _themeColor),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text('ThemeTest'),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.favorite),
                Icon(Icons.airport_shuttle),
                Text('颜色主题跟随'),
              ],
            ),
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(
                    color: Colors.black
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite),
                    Icon(Icons.airport_shuttle),
                    Text("  颜色固定黑色")
                  ]
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              _themeColor = (_themeColor==Colors.teal?Colors.green:Colors.teal);
            });
          },
          child: Icon(Icons.palette),
        ),
      ),
    );
  }

}