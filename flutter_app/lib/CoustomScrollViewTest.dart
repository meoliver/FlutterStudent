

import 'package:flutter/material.dart';

class CoustomScrollViewTest extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Material(
//      appBar: AppBar(
//        title: Text('CoustomScrollViewTest'),
//      ),
      child: CoustomScrollViewTestWidget(),
    );
  }
}

class CoustomScrollViewTestWidget extends StatefulWidget {
  @override
  _CoustomScrollViewTestWidgetState createState() => new _CoustomScrollViewTestWidgetState();
}

class _CoustomScrollViewTestWidgetState extends State<CoustomScrollViewTestWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _widget1();
  }
  _widget1() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('coustom demo'),
            background:Image.asset("./images/111.png",fit: BoxFit.cover,)
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(10.0),
          sliver: new SliverGrid(
              delegate: new SliverChildBuilderDelegate(
                      (BuildContext context, int index){
                        return new Container(
                          alignment: Alignment.center,
                          color: Colors.cyan[100*(index%9)],
                          child: new Text('grid item $index'),
                        );
                      },
                childCount: 20,

              ),
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
          ),
        ),
        new SliverFixedExtentList(
            delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                      return new Container(
                        alignment: Alignment.center,
                        color: Colors.lightBlue[100*(index%9)],
                        child: new Text("list item $index"),
                      );
                    },
              childCount: 50,
            ), 
            itemExtent: 50.0,
          
        ),

      ],
    );
  }

}