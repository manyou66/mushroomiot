import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wanmushroom/models/iot%3Emodel.dart';

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

  IotModel iotModel;

  //Method
  @override
  void initState() {
    super.initState();
    readDatabase();
  }

  Future<void> readDatabase() async {
    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
    DatabaseReference databaseReference =
        firebaseDatabase.reference().child('IoT');
    await databaseReference.once().then((DataSnapshot dataSnapshot) {
      print('dataSnapshot = ${dataSnapshot.value}');
      iotModel = IotModel.formMap(dataSnapshot.value);
      checkSwitch();
    });
  }

  void checkSwitch() {
    setState(() {
      
    if (iotModel.mode == 0) {
      modeBool = false;
    } else {
      modeBool = true;
    }
    if (iotModel.fog == 0) {
      fogBool = false;
    } else {
      fogBool = true;
    }
    if (iotModel.fan == 0) {
      fanBool = false;
    } else {
      fanBool = true;
    }
    if (iotModel.water == 0) {
      waterBool = false;
    } else {
      waterBool = true;
    }
    if (iotModel.light == 0) {
      lightBool = false;
    } else {
      lightBool = true;
    }
    });
    print(
        'Mode = $modeBool,Fog = $fogBool, Fan = $fanBool,Water = $waterBool, Light = $lightBool');
  }

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
                  value: fogBool,
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
                  value: fanBool,
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
                  value: waterBool,
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
      color: Colors.blue[300],
      //กรอบล้อมรอบ
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Text(
              'Light',
              style: TextStyle(color: Colors.white),
            ),
            Row(
              children: <Widget>[
                Text('OFF'),
                Switch(
                  value: lightBool,
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
      // fanBool = value;
      // fogBool = value;
      // waterBool = value;
      // lightBool = value;
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
          Colors.blue.shade500,
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
