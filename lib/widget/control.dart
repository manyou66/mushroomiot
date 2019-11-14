import 'package:flutter/material.dart';

class Control extends StatefulWidget {
  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
  //Field
  bool modeBool = false,
      fogBool = false,
      fanBool = false,
      lightBool = false,
      waterBool = false;

  //Method
  Widget switchMode() {
    return Card(
      //กรอบล้อมรอบ
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Text('Mode'),
            Row(
              children: <Widget>[
                Text('Auto'),
                Switch(
                  value: modeBool,
                  onChanged: (bool value) {
                    changeBool(value);
                  },
                ),
                Text('Manual'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget switchFog() {
    return Card(
      //กรอบล้อมรอบ
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Text('Fog'),
            Row(
              children: <Widget>[
                Text('OFF'),
                Switch(
                  value: modeBool,
                  onChanged: (bool value) {
                    changeBool(value);
                  },
                ),
                Text('ON'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget switchFan() {
    return Card(
      //กรอบล้อมรอบ
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Text('Fan'),
            Row(
              children: <Widget>[
                Text('OFF'),
                Switch(
                  value: modeBool,
                  onChanged: (bool value) {
                    changeBool(value);
                  },
                ),
                Text('ON'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget switchWater() {
    return Card(
      //กรอบล้อมรอบ
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Text('Water'),
            Row(
              children: <Widget>[
                Text('OFF'),
                Switch(
                  value: modeBool,
                  onChanged: (bool value) {
                    changeBool(value);
                  },
                ),
                Text('ON'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget switchLight() {
    return Card(
      //กรอบล้อมรอบ
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Text('Light'),
            Row(
              children: <Widget>[
                Text('OFF'),
                Switch(
                  value: modeBool,
                  onChanged: (bool value) {
                    changeBool(value);
                  },
                ),
                Text('ON'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void changeBool(bool value) {
    setState(() {
      modeBool = value;
      print('modeBool = $modeBool');
    });
  }

  Widget topRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        switchFog(),
        switchFan(),
      ],
    );
  }

  Widget modeRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[switchMode()],
    );
  }

  Widget bottonRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        switchWater(),
        switchLight(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(colors: [
          Colors.white,
          Colors.blue.shade700,
        ], radius: 1.0),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            modeRow(),
            topRow(),
            bottonRow(),
          ],
        ),
      ),
    );
  }
}
