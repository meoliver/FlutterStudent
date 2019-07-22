import 'package:flutter/material.dart';
// 滑动控制

class ScrollControllerTest extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScrollControllerTestWidget'),
      ),
      body: ScrollControllerTestWidget(),
    );
  }
}



class ScrollControllerTestWidget extends StatefulWidget {
  @override
  _ScrollControllerTestWidgetState createState() => new _ScrollControllerTestWidgetState();
}

class _ScrollControllerTestWidgetState extends State<ScrollControllerTestWidget> {

  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;//是否显示回顶部按钮
  String _progress = "0%"; //保存进度百分比

  @override
  void initState() {
    super.initState();

    _controller.addListener(
        (){
          print(_controller.offset);
          if(_controller.offset < 1000 && showToTopBtn) {
            setState(() {
              showToTopBtn = false;
            });
          } else if (_controller.offset >= 1000 && !showToTopBtn) {
            setState(() {
              showToTopBtn = true;
            });
          }
        }
    );

  }
  
  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _widget2();
  }
  _widget1() {
    return Stack(
      children: <Widget>[
        ListView.builder(
          itemBuilder: (context,index){ return ListTile(title: Text("$index"),);},
          itemCount: 100,
          itemExtent: 50.0,
          controller: _controller,
        ),
        Positioned(
          bottom: 50.0,
          right: 50.0,
          child: Offstage(
            offstage:!showToTopBtn,
            child: FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: (){
                _controller.animateTo(0.0, duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
            ),
          ),
        ),

      ],
    );
  }

  _widget2() {
    return Scrollbar(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification){
          double progress = notification.metrics.pixels/notification.metrics.maxScrollExtent;
          setState(() {
            _progress = "${(progress * 100).toInt()}%";
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
                itemCount: 100,
                itemExtent: 50.0,
                itemBuilder: (context, index) {
                  return ListTile(title: Text("$index"));
                }
            ),
            CircleAvatar(  //显示进度百分比
              radius: 30.0,
              child: Text(_progress),
              backgroundColor: Colors.black54,
            )
          ],
        ),
      ),
    );
  }

}