import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wanmushroom/models/iotmodel.dart';
import 'package:wanmushroom/utility/my_style.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  // Field
  IotModel iotModel;
  String //humHight = '',
      // humLow = '',
      // temHight = '',
      //temLow = '',
      suitableTem = '',
      suitableHumi = '',
      suitable_Humi_High = '',
      waterFloorDuration = '',
      humi_Out = '',
      fogOff_Duration = '',
      fogOn_Duration = '',
      fanOff_Duration = '',
      fanOn_Duration = '';

  final formKey = GlobalKey<FormState>();

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
      setState(() {
        iotModel = IotModel.formMap(dataSnapshot.value);
        // humLow = iotModel.humidityLow.toString();
        //  humHight = iotModel.humidityHigh.toString();
        //  temHight = iotModel.tempHigh.toString();
        //  temLow = iotModel.tempLow.toString();
        suitableTem = iotModel.suitableTem.toString();
        suitableHumi = iotModel.suitableHumi.toString();
        suitable_Humi_High = iotModel.suitable_Humi_High.toString();
        waterFloorDuration = iotModel.waterFloorDuration.toString();
        humi_Out = iotModel.humi_Out.toString();
        fogOff_Duration = iotModel.fogOff_Duration.toString();
        fogOn_Duration = iotModel.fogOn_Duration.toString();
        fanOff_Duration = iotModel.fanOff_Duration.toString();
        fanOn_Duration = iotModel.fanOn_Duration.toString();
      });
    });
  }

  Widget waterFloorDura() {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        child: TextFormField(
          initialValue: waterFloorDuration,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            helperText: 'Current: $waterFloorDuration',
            helperStyle: Mystyle().red18,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            labelText: 'WaterFloor Duration',
            labelStyle: Mystyle().orange18,
          ),
          onSaved: (String value) {
            if (value.isNotEmpty) {
              waterFloorDuration = value.trim();
            }
          },
        ),
      ),
    );
  }

  Widget fanOffDuration() {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        child: TextFormField(
          initialValue: fanOff_Duration,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            helperText: 'Current: $fanOff_Duration',
            helperStyle: Mystyle().red18,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            labelText: 'FanOff Duration',
            labelStyle: Mystyle().orange18,
          ),
          onSaved: (String value) {
            if (value.isNotEmpty) {
              fanOff_Duration = value.trim();
            }
          },
        ),
      ),
    );
  }

  Widget fanOnDuration() {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        child: TextFormField(
          initialValue: fanOn_Duration,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            helperText: 'Current: $fanOn_Duration',
            helperStyle: Mystyle().red18,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            labelText: 'FanOn Duration',
            labelStyle: Mystyle().orange18,
          ),
          onSaved: (String value) {
            if (value.isNotEmpty) {
              fanOn_Duration = value.trim();
            }
          },
        ),
      ),
    );
  }

  Widget fogOffDuration() {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        child: TextFormField(
          initialValue: fogOff_Duration,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            helperText: 'Current: $fogOff_Duration',
            helperStyle: Mystyle().red18,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            labelText: 'FogOff Duration',
            labelStyle: Mystyle().orange18,
          ),
          onSaved: (String value) {
            if (value.isNotEmpty) {
              fogOff_Duration = value.trim();
            }
          },
        ),
      ),
    );
  }

  Widget fogOnDuration() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        initialValue: fogOn_Duration,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          helperText: 'Current: $fogOn_Duration',
          helperStyle: Mystyle().red18,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'FogOn Duration',
          labelStyle: Mystyle().orange18,
        ),
        onSaved: (String value) {
          if (value.isNotEmpty) {
            fogOn_Duration = value.trim();
          }
        },
      ),
    );
  }

  Widget humiOut() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        initialValue: humi_Out,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          helperText: 'Current: $humi_Out',
          helperStyle: Mystyle().red18,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Humidity Out',
          labelStyle: Mystyle().orange18,
        ),
        onSaved: (String value) {
          if (value.isNotEmpty) {
            humi_Out = value.trim();
          }
        },
      ),
    );
  }

  Widget suitableHumiHigh() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        initialValue: suitable_Humi_High,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          helperText: 'Current: $suitable_Humi_High',
          helperStyle: Mystyle().red18,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Suitable Humi High',
          labelStyle: Mystyle().orange18,
        ),
        onSaved: (String value) {
          if (value.isNotEmpty) {
            suitable_Humi_High = value.trim();
          }
        },
      ),
    );
  }

  Widget suitableHu() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        initialValue: suitableHumi,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          helperText: 'Current: $suitableHumi',
          helperStyle: Mystyle().red18,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Suitable Humi',
          labelStyle: Mystyle().orange18,
        ),
        onSaved: (String value) {
          if (value.isNotEmpty) {
            suitableHumi = value.trim();
          }
        },
      ),
    );
  }

  Widget suitableTemp() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        initialValue: suitableTem,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          helperText: 'current: $suitableTem',
          helperStyle: Mystyle().red18,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Suitable Temp',
          labelStyle: Mystyle().orange18,
        ),
        onSaved: (String value) {
          if (value.isNotEmpty) {
            suitableTem = value.trim();
          }
        },
      ),
    );
  }

  Widget row1() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        suitableHu(),
        SizedBox(
          width: 10.0,
        ),
        suitableHumiHigh()
      ],
    );
  }

  Widget row2() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        suitableTemp(),
        SizedBox(
          width: 10.0,
        ),
        humiOut()
      ],
    );
  }

  Widget row3() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        fogOnDuration(),
        SizedBox(
          width: 10.0,
        ),
        fogOffDuration()
      ],
    );
  }

  Widget row4() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        fanOnDuration(),
        SizedBox(
          width: 10.0,
        ),
        fanOffDuration()
      ],
    );
  }

  Widget row5() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        waterFloorDura(),
        SizedBox(
          width: 10.0,
        ),
        uploadButton()
      ],
    );
  }

  Widget uploadButton() {
    return RaisedButton.icon(
      textColor: Mystyle().textColor,
      icon: Icon(Icons.cloud_upload),
      label: Text('Upload Value', style: Mystyle().red18),
      onPressed: () {
        formKey.currentState.save();
        editDatabase();
      },
    );
  }

  Future<void> editDatabase() async {
    //print(
    //    'HumidityHight =$humHight,HumidityLow = $humLow,TemHight = $temHight,TemLow = $temLow,SuitableHumi =$suitableHumi,SuitableTem=$suitableTem');
    IotModel myIotModel = IotModel(
        int.parse(suitableTem),
        iotModel.water,
        int.parse(suitableHumi), //convert string to int
        iotModel.light,
        iotModel.fog,
        iotModel.fan,
        int.parse(fanOff_Duration),
        int.parse(fanOn_Duration),
        iotModel.mode,
        int.parse(fogOff_Duration),
        int.parse(fogOn_Duration),
        int.parse(suitable_Humi_High),
        int.parse(waterFloorDuration),
        int.parse(humi_Out));
    Map map = myIotModel.toMap();
    print('map = $map');
    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
    DatabaseReference databaseReference =
        firebaseDatabase.reference().child('IoT');
    await databaseReference.set(map).then((response) {
      readDatabase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //แก้แป้นพิมพ์ล้น
      child: Container(
        padding: EdgeInsets.only(top: 15.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              row1(),
              SizedBox(
                height: 15.0,
              ),
              row2(),
              SizedBox(
                height: 15.0,
              ),
              row3(),
              SizedBox(
                height: 15.0,
              ),
              row4(),
              SizedBox(
                height: 15.0,
              ),
              row5(),
              SizedBox(
                height: 15.0,
              ),
              // uploadButton(),
            ],
          ),
        ),
      ),
    );
  }
}
