import 'package:flutter/material.dart';


class HeroAnimationTest extends StatefulWidget {
  @override
  _HeroAnimationTestState createState() => new _HeroAnimationTestState();
}

class _HeroAnimationTestState extends State<HeroAnimationTest> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      body: _widget1(),
    );
  }
  _widget1() {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        child: Hero(tag: "avatar", child: ClipOval(
          child: Image.asset('images/222.jpg',width: 50,),
        )),
        onTap: (){
          Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder:(BuildContext context, Animation animation, Animation secondaryAnimation){
                  return new FadeTransition(
                    opacity: animation,
                    child: Scaffold(
                      appBar: AppBar(
                        title: Text('原图'),
                      ),
                      body: HeroAnimationRouteB(),
                    ),
                  );
                }
            ),
          );
        },
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.asset("images/222.jpg"),
      ),
    );
  }
}