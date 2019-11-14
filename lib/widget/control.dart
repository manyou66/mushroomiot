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

  int modeInt = 0, fogInt = 0, fanInt = 0, waterInt = 0, lightInt = 0;

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
      modeInt = iotModel.mode;
      fogInt = iotModel.fog;
      fanInt = iotModel.fan;
      waterInt = iotModel.water;
      lightInt = iotModel.light;
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
                    if (value) {
                      modeInt = 1;
                      changeModeBool(value);
                    } else {
                      modeInt = 0;
                      changeModeBool(value);
                    }
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
                    if (value) {
                      fogInt = 1;
                      changeFogBool(value);
                    } else {
                      fogInt = 0;
                      changeFogBool(value);
                    }
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
                    if (value) {
                      fanInt = 1;
                      changeFanBool(value);
                    } else {
                      fanInt = 0;
                      changeFanBool(value);
                    }
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
                    if (value) {
                      waterInt = 1;
                      changeWaterBool(value);
                    } else {
                      waterInt = 0;
                      changeWaterBool(value);
                    }
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
                    if (value) {
                      lightInt = 1;
                      changeLightBool(value);
                    } else {
                      lightInt = 0;
                      changeLightBool(value);
                    }
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

  Future<void> editDatabase() async {
    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
    DatabaseReference databaseReference =
        firebaseDatabase.reference().child('IoT');
    Map<dynamic, dynamic> map = Map();
    map['Water'] = waterInt;
    map['Fan'] = fanInt;
    map['Temp_High'] = iotModel.tempHigh;
    map['Humidity_High'] = iotModel.humidityHigh;
    map['Humidity_Low'] = iotModel.humidityLow;
    map['Light'] = lightInt;
    map['Mode'] = modeInt;
    map['Temp_Low'] = iotModel.tempLow;
    map['Suitable_Humi'] = iotModel.suitableHumi;
    map['Fog'] = fogInt;
    map['Suitable_Tem'] = iotModel.suitableTem;

    await databaseReference.set(map).then((response){
      print('Edit Success');
    });
  }

  void changeModeBool(bool value) {
    setState(() {
      //redrawing screen
      modeBool = value;
      editDatabase();
    });
  }

  void changeFogBool(bool value) {
    setState(() {
      fogBool = value;
      editDatabase();
    });
  }

  void changeFanBool(bool value) {
    setState(() {
      fanBool = value;
      editDatabase();
    });
  }

  void changeLightBool(bool value) {
    setState(() {
      lightBool = value;
      editDatabase();
    });
  }

  void changeWaterBool(bool value) {
    setState(() {
      waterBool = value;
      editDatabase();
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
