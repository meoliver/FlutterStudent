import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart'; // 导入的包

class ListViewTest extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListViewTest'),
      ),
      body: ListViewTestWidget(),
    );
  }
}



class ListViewTestWidget extends StatefulWidget {
  @override
  _ListViewTestWidgetState createState() => new _ListViewTestWidgetState();
}

class _ListViewTestWidgetState extends State<ListViewTestWidget> {

  static const loadingTag = '##loading##';
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        ListTile(title: Text('列表'),),
        Expanded(
          child: _widget1(),
        ),
      ],
    );
  }
  _widget1() {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(height: .0),
      itemCount: _words.length,
      itemBuilder: (context, index) {
        if(_words[index] == loadingTag) {
          if(_words.length - 1 < 100) {
            _retrieveData();
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(strokeWidth: 2.0,),
              ),
            );
          } else {
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text("没有更多了", style: TextStyle(color: Colors.grey),)
            );
          }
        }
        return ListTile(title: Text(_words[index]),);
      },
    );
  }

  _itemBuilder(context, index){

  }

  _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
//      _words.insert(_words.length - 1, "1");
      _words.insertAll(_words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        //重新构建列表
      });
    });
  }

}