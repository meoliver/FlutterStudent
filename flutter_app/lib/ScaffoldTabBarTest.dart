import 'package:flutter/material.dart';


class ScaffoldTabBarTest extends StatefulWidget  {
  @override
  _ScaffoldTabBarTestWidgetstate createState() => new _ScaffoldTabBarTestWidgetstate();
}

class _ScaffoldTabBarTestWidgetstate extends State<ScaffoldTabBarTest> with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  TabController _tabController; //需要定义一个Controller

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener((){
      tabViewClick(_tabController.index);

    });
  }

  tabViewClick(int index) {

  }

  // TODO: implement build
  @override
  Widget build(BuildContext context) {
    return _widget1();
  }
  _widget1() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ScaffoldTabBarTest'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){
              print('分享');
            },
          ),
          IconButton(
            icon: Icon(Icons.alarm),
            onPressed: (){
              print('闹钟');
            },
          ),

        ],
        leading: Builder(
          builder: (context){
            return IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: '新闻',),
            Tab(text: '历史',),
            Tab(text: '图片',),
          ],

        ),
      ),
      drawer: new MyDrawer(),
      bottomNavigationBar: _bottomtabbar2(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:FloatingActionButton(
        onPressed: _onAdd,
        child: Icon(Icons.add),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text('新闻',textScaleFactor: 5,),
          ),
          Container(
            alignment: Alignment.center,
            child: Text('历史',textScaleFactor: 5,),
          ),
          Container(
            alignment: Alignment.center,
            child: Text('图片',textScaleFactor: 5,),
          ),
        ],
      ),

//      body: ScaffoldTabBarTestWidget(),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onAdd(){
  }

  // bottom tabbar 样式1
  _bottomtabbar1(){
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('Home')),
        BottomNavigationBarItem(icon: Icon(Icons.business),title: Text('Business')),
        BottomNavigationBarItem(icon: Icon(Icons.school),title: Text('School')),
      ],
      currentIndex: _selectedIndex,
      fixedColor: Colors.blue,
      onTap: _onItemTapped,

    );
  }

  // bottom tabbar 样式2
  _bottomtabbar2(){
    return BottomAppBar(

      color: Colors.white,
      shape: CircularNotchedRectangle(),
      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.home),),
          SizedBox(),
          IconButton(icon: Icon(Icons.business)),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,

      ),

    ) ;
  }

}


class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // DrawerHeader consumes top MediaQuery padding.
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "imgs/avatar.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


