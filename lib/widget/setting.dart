import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wanmushroom/models/iot%3Emodel.dart';
import 'package:wanmushroom/utility/my_style.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  // Field
  IotModel iotModel;
  String humHight = '',
      humLow = '',
      temHight = '',
      temLow = '',
      suitableTem = '',
      suitableHumi = '';

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
        humLow = iotModel.humidityLow.toString();
        humHight = iotModel.humidityHigh.toString();
        temHight = iotModel.tempHigh.toString();
        temLow = iotModel.tempLow.toString();
        suitableTem = iotModel.suitableTem.toString();
        suitableHumi = iotModel.suitableHumi.toString();
      });
    });
  }

  Widget humidityHight() {
    return Card(
          child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        child: TextFormField(
          initialValue: humHight,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            helperText: 'Current: $humHight',helperStyle: Mystyle().red18,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            labelText: 'Humidity Hight',labelStyle: Mystyle().orange18,
          ),
          onSaved: (String value) {
            if (value.isNotEmpty) {
              humHight = value.trim();
            }
          },
        ),
      ),
    );
  }

  Widget humidityLow() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        initialValue: humLow,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          helperText: 'Current: $humLow',helperStyle: Mystyle().red18,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Humidity Low',labelStyle: Mystyle().orange18,
        ),
        onSaved: (String value) {
          if (value.isNotEmpty) {
            humLow = value.trim();
          }
        },
      ),
    );
  }

  Widget tempHight() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        initialValue: temHight,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          helperText: 'Current: $temHight',helperStyle: Mystyle().red18,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Temp Hight',labelStyle: Mystyle().orange18,
        ),
        onSaved: (String value) {
          if (value.isNotEmpty) {
            temHight = value.trim();
          }
        },
      ),
    );
  }

  Widget tempLow() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        initialValue: temLow,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          helperText: 'Current: $temLow',helperStyle: Mystyle().red18,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Temp Low',labelStyle: Mystyle().orange18,
        ),
        onSaved: (String value) {
          if (value.isNotEmpty) {
            temLow = value.trim();
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
          helperText: 'Current: $suitableHumi',helperStyle: Mystyle().red18,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Suitable Humi',labelStyle: Mystyle().orange18,
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
          helperText: 'current: $suitableTem',helperStyle: Mystyle().red18,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Suitable Temp',labelStyle: Mystyle().orange18,
        ),
        onSaved: (String value) {
          if (value.isNotEmpty) {
            suitableTem = value.trim();
          }
        },
      ),
    );
  }

  Widget rowTop() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        humidityLow(),
        SizedBox(
          width: 10.0,
        ),
        humidityHight()
      ],
    );
  }

  Widget rowMiddle() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        tempLow(),
        SizedBox(
          width: 10.0,
        ),
        tempHight()
      ],
    );
  }

  Widget rowBottom() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        suitableHu(),
        SizedBox(
          width: 10.0,
        ),
        suitableTemp()
      ],
    );
  }

  Widget uploadButton() {
    return RaisedButton.icon(textColor: Mystyle().textColor,
      icon: Icon(Icons.cloud_upload),
      label: Text('Upload Value',style: Mystyle().red18),
      onPressed: () {
        formKey.currentState.save();
        editDatabase();
      },
    );
  }

  Future<void> editDatabase()async {
    print(
        'HumidityHight =$humHight,HumidityLow = $humLow,TemHight = $temHight,TemLow = $temLow,SuitableHumi =$suitableHumi,SuitableTem=$suitableTem');
    IotModel myIotModel = IotModel(
        int.parse(suitableTem),
        iotModel.water,
        int.parse(suitableHumi), //convert string to int
        iotModel.light,
        iotModel.fog,
        iotModel.fan,
        int.parse(humHight),
        int.parse(humLow),
        iotModel.mode,
        int.parse(temHight),
        int.parse(temLow));
    Map map = myIotModel.toMap();
    print('map = $map');
    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
    DatabaseReference databaseReference = firebaseDatabase.reference().child('IoT');
    await databaseReference.set(map).then((response){
      readDatabase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //แก้แป้นพิมพ์ล้น
      child: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              rowTop(),
              SizedBox(
                height: 15.0,
              ),
              rowMiddle(),
              SizedBox(
                height: 15.0,
              ),
              rowBottom(),
              SizedBox(
                height: 15.0,
              ),
              uploadButton(),
            ],
          ),
        ),
      ),
    );
  }
}
