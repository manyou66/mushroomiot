import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class Monitor extends StatefulWidget {
  @override
  _MonitorState createState() => _MonitorState();
}

class _MonitorState extends State<Monitor> {
  //Field
  String gateTemp='https://thingspeak.com/channels/662286/widgets/93565';
  String gateHumidity ='https://thingspeak.com/channels/662286/charts/1?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15';
  
  //Method
  // Widget showWebView(String url) {
  //   return Container(width: 200.0,height: 200.0,
  //     child: WebView(
  //       initialUrl: url,javascriptMode: JavascriptMode.unrestricted,
  //     ),
  //   );
  // }

  // Widget showAllGade() {
  //   return Container(
  //     padding: EdgeInsets.all(20.0),
  //     height: MediaQuery.of(context).size.height * 0.5, //screen / 2
  //     width: MediaQuery.of(context).size.width,
  //     child: Row(
  //       children: <Widget>[showWebView(gateTemp)],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Monitor')),
    );
  }
}
