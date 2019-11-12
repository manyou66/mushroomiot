import 'package:flutter/material.dart';
import 'package:wanmushroom/screens/home.dart';  //Theme

void main(){
 runApp(MyApp());
}
//every things on screen call statless
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPC Mushroom',
      home: Home(),
      
    );
  }
}