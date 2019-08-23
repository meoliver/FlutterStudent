import 'package:flutter/material.dart';
import 'TextTest.dart';
import 'Tapbox.dart';
import 'TextFieldTest.dart';
import 'RowColumnTest.dart';
import 'FlexTest.dart';
import 'WrapFlowTest.dart';
import 'StackPositionedTest.dart';
import 'SingleChildScrollviewTest.dart';
import 'ListViewTest.dart';
import 'GridViewTest.dart';
import 'CoustomScrollViewTest.dart';
import 'ScrollControllerTest.dart';
import 'PaddingTest.dart';
import 'ConstrainedAndSizedBox.dart';
import 'DecoratedBoxTest.dart';
import 'TransformTest.dart';
import 'ContainerTest.dart';
import 'ScaffoldTabBarTest.dart';
import 'WillPopScopeTest.dart';
import 'ThemeTest.dart';
import 'InheritedWidgetTest.dart';
import 'ListenerTest.dart';
import 'GestureDetectorTest.dart';
import 'AnimationTest.dart';
import 'HeroAnimationTest.dart';
import 'StaggerAnimationTest.dart';
import 'AnimatedSwitcherTest.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(BuildContext context) => MyHomePage(title: 'Flutter Demo Home Page'),
        '/TextTest':(BuildContext context) => TextTest(),
        '/TextFieldtest':(BuildContext context) => TextFieldtest(),
        '/RowColumn':(BuildContext context) => RowColumn(),
        '/FlexTest':(BuildContext context) => flexTest(),
        '/WrapFlowTes':(BuildContext context) => WrapFlowTes(),
        '/StackPositionedTest':(BuildContext context) => StackPositionedTest(),
        "/SingleChildScrollviewTest":(BuildContext context) => SingleChildScrollviewTest(),
        "/ListViewTest":(BuildContext context) => ListViewTest(),
        "/GridViewTest":(BuildContext context) => GridViewTest(),
        "/CoustomScrollViewTest":(BuildContext context) => CoustomScrollViewTest(),
        "/ScrollControllerTest":(BuildContext context) => ScrollControllerTest(),
        "/ParentWidgetC":(BuildContext context) => ParentWidgetC(),
        "/PaddingTest":(BuildContext context) => PaddingTest(),
        "/ConstrainedAndSizedBox":(BuildContext context) => ConstrainedAndSizedBox(),
        "/DecoratedBoxTest":(BuildContext context) => DecoratedBoxTest(),
        "/TransformTest":(BuildContext context) => TransformTest(),
        "/ContainerTest":(BuildContext context) => ContainerTest(),
        "/ScaffoldTabBarTest":(BuildContext context) => ScaffoldTabBarTest(),
        "/WillPopScopeTest":(BuildContext context) => WillPopScopeTest(),
        "/ThemeTest":(BuildContext context) => ThemeTest(),
        "/InheritedWidgetTest":(BuildContext context) => InheritedWidgetTest(),
        "/ListenerTest":(BuildContext context) => ListenerTest(),
        "/GestureDetectorTest":(BuildContext context) => GestureDetectorTest(),
        "/AnimationTest":(BuildContext context) => AnimationTest(),
        "/HeroAnimationTest":(BuildContext context) => HeroAnimationTest(),
        "/StaggerAnimationTest":(BuildContext context) => StaggerAnimationTest(),
        "/AnimatedSwitcherTest":(BuildContext context) => AnimatedSwitcherTest(),



      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.separated(
        separatorBuilder:(BuildContext context, int index) {
          return Divider(color: Colors.grey);
        },
        itemCount: 30,
        itemBuilder: (context, index) {
          return getRow(index);
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  getRow(int index) {

    String _name = getName(index);

    return new GestureDetector(
      child: ListTile(title: Text("$_name")),
      onTap: (){
        Navigator.pushNamed(context, '/$_name');

        // 使用动画
//          Navigator.push(
//            context,
//              PageRouteBuilder(
//                transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
//                pageBuilder: (BuildContext context, Animation animation,
//                    Animation secondaryAnimation) {
//                  return new FadeTransition(
//                    //使用渐隐渐入过渡,
//                    opacity: animation,
//                    child: StackPositionedTest(), //路由B
//                  );
//                },
//              ),
//          );

      
      },
    );
  }

  getName(int index) {
    String name = '';
    if (index == 0) {
      name = "TextTest";
    } else if (index == 1) {
      name = "TextFieldtest";
    } else if (index == 2) {
      name = "RowColumn";
    } else if (index == 3) {
      name = "FlexTest";
    } else if (index == 4) {
     name = "WrapFlowTes";
    } else if (index == 5) {
      name = "StackPositionedTest";
    } else if (index == 6) {
     name = "SingleChildScrollviewTest";
    } else if (index == 7) {
      name = "ListViewTest";
    } else if (index == 8) {
      name = "GridViewTest";
    } else if (index == 9) {
      name = "CoustomScrollViewTest";
    } else if (index == 10) {
      name = "ScrollControllerTest";
    } else if (index == 11) {
      name = "ParentWidgetC";
    } else if (index == 12) {
      name = "PaddingTest";
    } else if (index == 13) {
      name = "ConstrainedAndSizedBox";
    } else if (index == 14) {
      name = "DecoratedBoxTest";
    } else if (index == 15) {
      name = "TransformTest";
    } else if (index == 16) {
      name = "ContainerTest";
    } else if (index == 17) {
      name = "ScaffoldTabBarTest";
    } else if (index == 18) {
      name = "WillPopScopeTest";
    } else if (index == 19) {
      name = "ThemeTest";
    } else if (index == 20) {
      name = "InheritedWidgetTest";
    } else if (index == 21) {
      name = "ListenerTest";
    } else if (index == 22) {
      name = "GestureDetectorTest";
    } else if (index == 23) {
      name = "AnimationTest";
    } else if (index == 24) {
      name = "HeroAnimationTest";
    } else if (index == 25) {
      name = "StaggerAnimationTest";
    } else if (index == 26) {
      name = "AnimatedSwitcherTest";
    } else if (index == 27) {
      name = "待续。。。";
    } else if (index == 28) {
      name = "待续。。。";
    } else if (index == 29) {
      name = "待续。。。";
    }
    return name;
  }


}


