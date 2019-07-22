import 'package:flutter/material.dart';

class flexTest extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flex'),
      ),
      body: flexTestWidget(),
    );
  }
}


class flexTestWidget extends StatefulWidget {
  @override
  _flexTestWidgetState createState() => new _flexTestWidgetState();
}

class _flexTestWidgetState extends State<flexTestWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _wedget1();
  }

  _wedget1(){
    return Column(
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 30.0,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 30.0,
                color: Colors.blue,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: SizedBox(
            height: 300.0,
            child:Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 25.0,
                    color: Colors.red,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }


}