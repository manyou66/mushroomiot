import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  // Field

  //Method
  Widget humidityHight() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Humidity Hight',
        ),
      ),
    );
  }

  Widget humidityLow() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Humidity Low',
        ),
      ),
    );
  }

  Widget tempHight() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Temp Hight',
        ),
      ),
    );
  }

  Widget tempLow() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Temp Low',
        ),
      ),
    );
  }

  Widget suitableHumi() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Suitable Humidity',
        ),
      ),
    );
  }

  Widget suitableTemp() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: 'Suitable Temp',
        ),
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
        suitableHumi(),
        SizedBox(
          width: 10.0,
        ),
        suitableTemp()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50.0),
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
        ],
      ),
    );
  }
}
