import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  //tranfer data
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //create stateless

// Field

// Method
  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'โรงเห็ดอัจฉริยะ',
      style: TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
        color: Colors.orange[700],
        fontStyle: FontStyle.italic,
        fontFamily: 'Itim',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showLogo(),
              showAppName(),
            ],
          ),
        ),
      ), //safearea is area to show on screen
    );
  }
}
