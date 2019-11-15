import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wanmushroom/screens/home.dart';
import 'package:wanmushroom/utility/my_style.dart';
import 'package:wanmushroom/widget/add_display_name.dart';
import 'package:wanmushroom/widget/control.dart';
import 'package:wanmushroom/widget/home_service.dart';
import 'package:wanmushroom/widget/monitor.dart';
import 'package:wanmushroom/widget/page2.dart';
import 'package:wanmushroom/widget/page3.dart';
import 'package:wanmushroom/widget/setting.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  //Field
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String login = '...';
  Widget currentWidget = HomeService();

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
          menuHome(),
          menuAddDisplayName(),
          menuPage2(),
          menuPage3(),
          menuSignOut(),
        ],
      ),
    );
  }

  Widget showHead() {
    return DrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/logo2.jpg'), fit: BoxFit.cover),
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
    return Text(
      'Smart Mushroom',
      style: Mystyle().red18,
    );
  }

  Widget showLogin() {
    return Text(
      'User: $login,',
      style: Mystyle().red18,
    );
  }

  Widget menuAddDisplayName() {
    return ListTile(
      leading: Icon(
        Icons.filter_1,
      ),
      title: Text('Add Display Name'),
      subtitle: Text('Add of Change Display Name'),
      onTap: () {
        Navigator.of(context).pop();
        setState(() {
          currentWidget = AddDisplayName();
        });
      },
    );
  }

  Widget menuPage2() {
    return ListTile(
      leading: Icon(
        Icons.filter_2,
      ),
      title: Text('Page2'),
      subtitle: Text('Description Page 2'),
      onTap: () {
        Navigator.of(context).pop();
        setState(() {
          currentWidget = Page2();
        });
      },
    );
  }

  Widget menuPage3() {
    return ListTile(
      leading: Icon(
        Icons.filter_3,
      ),
      title: Text('Page3'),
      subtitle: Text('Description Page 3'),
      onTap: () {
        Navigator.of(context).pop();
        setState(() {
          currentWidget = Page3();
        });
      },
    );
  }

  Widget menuSignOut() {
    return ListTile(
      leading: Icon(
        Icons.exit_to_app,
      ),
      title: Text('Logout'),
      subtitle: Text('Logout'),
      onTap: () {
        Navigator.of(context).pop();
        processLogOut();
      },
    );
  }

  Future<void> processLogOut() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut().then((response) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
      Navigator.of(context).pushAndRemoveUntil(materialPageRoute,
          (Route<dynamic> route) {
        return false;
      });
    });
  }

  Widget menuHome() {
    return ListTile(
      leading: Icon(
        Icons.home,
      ),
      title: Text('Home'),
      subtitle: Text('Description home'),
      onTap: () {
        Navigator.of(context).pop();
        setState(() {
          currentWidget = HomeService();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
      ),
      key: scaffoldKey,
      body: currentWidget,
      drawer: showDrawer(), //แฝงด้านข้างขวา
    );
  }
}
