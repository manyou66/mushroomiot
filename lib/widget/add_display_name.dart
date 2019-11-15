import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddDisplayName extends StatefulWidget {
  @override
  _AddDisplayNameState createState() => _AddDisplayNameState();
}

class _AddDisplayNameState extends State<AddDisplayName> {
  // Field
  String currentName = 'Non';

  //Method
  @override
  void inintState() {
    super.initState();
    findDisplay();
  }

  Future<void> findDisplay() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    String testName = firebaseUser.displayName;
    if (testName != null) {
      setState(() {
        currentName = testName;
      });
    }
    print('Current Name: $currentName');
  }

  Widget displayNameText() {
    return Center(
      child: Container(
        width: 250.0,
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Display Name',
            helperText: 'Current Name =>$currentName',
          ),
        ),
      ),
    );
  }

  Widget uploadDisplayName() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15.0),
              child: FloatingActionButton(
                child: Icon(Icons.cloud_upload),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          displayNameText(),
          uploadDisplayName(),
        ],
      ),
    );
  }
}
