//import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wanmushroom/screens/my_service.dart';
import 'package:wanmushroom/utility/my_dialog.dart';
import 'package:wanmushroom/utility/my_style.dart';

class Home extends StatefulWidget {
  //tranfer data
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //create stateless

// Field
  String email, password;
  final formKey = GlobalKey<FormState>();

// Method
  @override  //method do first before build method 
  void initState(){
    super.initState();
    checkStatus(); //check status on firebase that login or not login if login is true move to Myservice
  }

  Future<void> checkStatus() async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser != null) {
      moveToMyService();
    }

  }

  Widget loginButton() {
    return Container(
      width: 250.0,
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        color: Mystyle().textColor,
        icon: Icon(
          Icons.account_circle,
          color: Colors.white,
        ),
        label: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          print('You Click Login');
          formKey.currentState.save();
          print('email=$email, password = $password');
          registerThread();
        },
      ),
    );
  }

  // Thread
  Future<void> registerThread() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((var response) {
      moveToMyService();
    }).catchError((var response) {
      print('response = $response');
      String title = response.code;
      String message = response.message;
      print('title = $title, message = $message');
      normalDialog(context, title, message);
    });
  }

  void moveToMyService() {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) {
      return MyService();
    }); //move to next page
    Navigator.of(context).pushAndRemoveUntil(materialPageRoute,
        (Route<dynamic> route) {
      return false;
    });
  }

  Widget emailText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        style: TextStyle(
          color: Mystyle().textColor,
        ),
        keyboardType: TextInputType.emailAddress, //keyboard style
        decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            size: 50.0,
            color: Mystyle().textColor,
          ),
          labelText: 'User : ',
          labelStyle: TextStyle(
            color: Mystyle().textColor,
          ),
          hintText: 'you@email.com',
        ),
        onSaved: (String value) {
          email = value.trim();
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true, //secure password
        style: TextStyle(
          color: Mystyle().textColor,
        ),
        keyboardType: TextInputType.text, //keyboard style
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            size: 50.0,
            color: Mystyle().textColor,
          ),
          labelText: 'Password : ',
          labelStyle: TextStyle(
            color: Mystyle().textColor,
          ),
          hintText: 'More 6 Charactor',
        ),
        onSaved: (String value) {
          password = value.trim();
        },
      ),
    );
  }

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
        color: Mystyle().textColor,
        fontStyle: FontStyle.italic,
        fontFamily: 'Itim',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/wall.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              //scroll view screen
              child: Container(
                padding: EdgeInsets.all(20.0),
                color: Color.fromARGB(120, 255, 255, 255),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      showLogo(),
                      SizedBox(
                        height: 15.0,
                      ),
                      showAppName(),
                      emailText(),
                      passwordText(),
                      SizedBox(
                        height: 15.0,
                      ),
                      loginButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ), //safearea is area to show on screen
    );
  }
}
