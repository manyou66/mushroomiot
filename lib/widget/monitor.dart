import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_web/flutter_native_web.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class Monitor extends StatefulWidget {
  @override
  _MonitorState createState() => _MonitorState();
}

class _MonitorState extends State<Monitor> {
  // Field
  String url1 =
          'https://thingspeak.com/channels/437885/charts/1?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line',
      url2 =
          'https://thingspeak.com/channels/662286/charts/1?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15',
      url3 =
          'https://thingspeak.com/channels/437885/charts/2?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line',
      url4 =
          'https://thingspeak.com/channels/662286/charts/2?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15',
      humiGageUrl = 'https://thingspeak.com/channels/662286/widgets/93495',
      temGageUrl = 'https://thingspeak.com/channels/662286/widgets/93565';

  String test1 = 'https://www.androidthai.in.th/pint/test1.html';
  String test2 = 'https://www.androidthai.in.th';

  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  String currentGraph = 'https://www.androidthai.in.th';

  Widget webViewShow = WebviewScaffold(
    url: 'https://www.androidthai.in.th',
    hidden: true,
    withJavascript: true,
    withZoom: true,
    initialChild: Container(
      child: Center(
        child: Text(''),
      ),
    ),
  );

  Widget showAllGade() {
    return Container(
      // padding: EdgeInsets.all(20.0),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[],
      ),
    );
  }

  Widget showTestWebView() {
    flutterWebviewPlugin.launch(
      humiGageUrl,
    );

    return webViewShow = WebviewScaffold(
      url: url1,
      hidden: true,
      withJavascript: true,
      withZoom: true,
      initialChild: Container(
        child: Center(
          child: Text(''),
        ),
      ),
    );
  }

  Future<void> hideWebView() async {
    flutterWebviewPlugin.hide();
  }

  Widget url1Button() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        RaisedButton(
          child: Text('Url1'),
          onPressed: () {
            setState(() {
              currentGraph = url1;
              flutterWebviewPlugin.reloadUrl(currentGraph);
              // flutterWebviewPlugin.hide();
            });
          },
        ),
      ],
    );
  }

  WebController webController;

  void onWebCreated(webController) {
    this.webController = webController;
    this.webController.loadUrl(url1);
    this.webController.onPageStarted.listen((url) => print("Loading $url"));
    this
        .webController
        .onPageFinished
        .listen((url) => print("Finished loading $url"));
  }

  

  @override
  Widget build(BuildContext context) {
    FlutterNativeWeb flutterWebView = new FlutterNativeWeb(
      onWebCreated: onWebCreated,
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
        Factory<OneSequenceGestureRecognizer>(
          () => TapGestureRecognizer(),
        ),
      ].toSet(),
    );

    

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            child: Text('Test'),
          ),Container(
            child: flutterWebView,
            height: 300.0,
            width: 500.0,
          ),
          
        ],
      ),
    );
  }
}