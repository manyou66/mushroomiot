import 'package:flutter/material.dart';

class Control extends StatefulWidget {
  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
  //Field
  bool modeBool = false;

  //Method
  Widget switchMode() {
    return Switch(
      value: modeBool,
      onChanged: (bool value) {
        changeBool(value);
      },
    );
  }

  void changeBool(bool value) {
    setState(() {
      modeBool = value;
      print('modeBool = $modeBool');
    });
  }

  Widget topRow() {
    return Row(mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        switchMode(),
        switchMode(),
      ],
    );
  }

  Widget bottonRow() {
    return Row(mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        switchMode(),
        switchMode(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          topRow(),
          bottonRow(),
        ],
      ),
    );
  }
}
