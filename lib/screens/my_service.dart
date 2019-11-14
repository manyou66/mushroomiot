import 'package:flutter/material.dart';
import 'package:wanmushroom/utility/my_style.dart';
import 'package:wanmushroom/widget/control.dart';
import 'package:wanmushroom/widget/monitor.dart';
import 'package:wanmushroom/widget/setting.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  //Field
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String login = '...';

  //Method
  //ขีดสามขีดข้างจอ
  Widget hambergerButton() {
    return IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {
        scaffoldKey.currentState.openDrawer();
      },
    );
  }

  Widget tabsMonitor() {
    return Tab(
      icon: Icon(Icons.airplay),
      text: 'Monitor',
    );
  }

  Widget tabsControl() {
    return Tab(
      icon: Icon(Icons.screen_lock_portrait),
      text: 'Control',
    );
  }

  Widget tabsSetting() {
    return Tab(
      icon: Icon(Icons.settings),
      text: 'Setting',
    );
  }

  //create tap menu
  Widget showTabController() {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: hambergerButton(),
          backgroundColor: Mystyle().textColor,
          title: Text('Smart Mushroom'),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 6.0,
            tabs: <Widget>[
              tabsMonitor(),
              tabsControl(),
              tabsSetting(),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Monitor(),
            Control(),
            Setting(),
          ],
        ),
      ),
    );
  }

  // side panel on app
  Widget showDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          showHead(),
        ],
      ),
    );
  }

  Widget showHead() {
    return DrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/wall.jpg'),fit: BoxFit.cover
        ),
      ),
      child: Column(
        children: <Widget>[showLogo(), showAppName(), showLogin()],
      ),
    );
  }

  Widget showLogo() {
    return Container(
      height: 80.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text('Smart Mushroom');
  }

  Widget showLogin() {
    return Text('User: $login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: showTabController(),
      drawer: showDrawer(), //แฝงด้านข้างขวา
    );
  }
}
