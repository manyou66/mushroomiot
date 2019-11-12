import 'package:flutter/material.dart';
import 'package:wanmushroom/utility/my_style.dart';

class Home extends StatefulWidget {
  //tranfer data
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //create stateless

// Field

// Method
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
        onPressed: () {},
      ),
    );
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
            child: SingleChildScrollView(   //scroll view screen
                          child: Container(
                padding: EdgeInsets.all(20.0),
                color: Color.fromARGB(120, 255, 255, 255),
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
      ), //safearea is area to show on screen
    );
  }
}
