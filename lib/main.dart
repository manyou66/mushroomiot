import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wanmushroom/screens/home.dart'; //Theme

void main() {
  runApp(MyApp());
}

//every things on screen call statless
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([ //lock screen by portrait
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false, //don't show debug on screen
      title: 'RPC Mushroom',
      home: Home(),
    );
  }
}
