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

  // side panel on app
  Widget showDrawer() {
    return Drawer();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: showTabController(),
      drawer: showDrawer(),
    );
  }
}
