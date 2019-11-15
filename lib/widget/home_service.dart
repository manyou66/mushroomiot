import 'package:flutter/material.dart';
import 'package:wanmushroom/utility/my_style.dart';
import 'package:wanmushroom/widget/setting.dart';

import 'control.dart';
import 'monitor.dart';

class HomeService extends StatefulWidget {
  @override
  _HomeServiceState createState() => _HomeServiceState();
}

class _HomeServiceState extends State<HomeService> {
  // Field

  //Method
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
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // leading: hambergerButton(),
          backgroundColor: Mystyle().textColor,
          // title: Text('Smart Mushroom'),
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
}