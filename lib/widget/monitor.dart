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
      humiGageUrl = 'https://thingspeak.com/channels/1156793/widgets/294248',
      temGageUrl = 'https://thingspeak.com/channels/1156793/widgets/294249',
      humi_inside =
          'https://thingspeak.com/channels/1156793/charts/1?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15',
      temp_inside =
          'https://thingspeak.com/channels/1156793/charts/2?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15',
      humi_outside =
          'https://thingspeak.com/channels/1156793/charts/3?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15',
      temp_outside =
          'https://thingspeak.com/channels/662286/charts/4?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15',
      carbon =
          'https://thingspeak.com/channels/1156793/charts/6?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15',
      light =
          'https://thingspeak.com/channels/1156793/charts/5?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15';

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

  WebController webController, webControllerGadeTem;

  void onWebCreatedCarboninside(webController) {
    this.webController = webController;
    this.webController.loadUrl(carbon);
    this.webController.onPageStarted.listen((url) => print("Loading $url"));
    this
        .webController
        .onPageFinished
        .listen((url) => print("Finished loading $url"));
  }

  void onWebCreatedLightinside(webController) {
    this.webController = webController;
    this.webController.loadUrl(light);
    this.webController.onPageStarted.listen((url) => print("Loading $url"));
    this
        .webController
        .onPageFinished
        .listen((url) => print("Finished loading $url"));
  }

  void onWebCreatedTempOutside(webController) {
    this.webController = webController;
    this.webController.loadUrl(temp_outside);
    this.webController.onPageStarted.listen((url) => print("Loading $url"));
    this
        .webController
        .onPageFinished
        .listen((url) => print("Finished loading $url"));
  }

  void onWebCreatedHumiOutside(webController) {
    this.webController = webController;
    this.webController.loadUrl(humi_outside);
    this.webController.onPageStarted.listen((url) => print("Loading $url"));
    this
        .webController
        .onPageFinished
        .listen((url) => print("Finished loading $url"));
  }

  void onWebCreatedTempInside(webController) {
    this.webController = webController;
    this.webController.loadUrl(temp_inside);
    this.webController.onPageStarted.listen((url) => print("Loading $url"));
    this
        .webController
        .onPageFinished
        .listen((url) => print("Finished loading $url"));
  }

  void onWebCreatedHumiInside(webController) {
    this.webController = webController;
    this.webController.loadUrl(humi_inside);
    this.webController.onPageStarted.listen((url) => print("Loading $url"));
    this
        .webController
        .onPageFinished
        .listen((url) => print("Finished loading $url"));
  }

  void onWebCreated(webController) {
    this.webController = webController;
    this.webController.loadUrl(humiGageUrl);
    this.webController.onPageStarted.listen((url) => print("Loading $url"));
    this
        .webController
        .onPageFinished
        .listen((url) => print("Finished loading $url"));
  }

  void onWebCreatedGadeTemperature(webController) {
    this.webControllerGadeTem = webController;
    this.webControllerGadeTem.loadUrl(temGageUrl);
    this
        .webControllerGadeTem
        .onPageStarted
        .listen((url) => print("Loading $url"));
    this
        .webControllerGadeTem
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
    FlutterNativeWeb flutterWebViewGadeTem = new FlutterNativeWeb(
      onWebCreated: onWebCreatedGadeTemperature,
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
        Factory<OneSequenceGestureRecognizer>(
          () => TapGestureRecognizer(),
        ),
      ].toSet(),
    );

    FlutterNativeWeb flutterWebViewHumiInside = new FlutterNativeWeb(
      onWebCreated: onWebCreatedHumiInside,
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
        Factory<OneSequenceGestureRecognizer>(
          () => TapGestureRecognizer(),
        ),
      ].toSet(),
    );

    FlutterNativeWeb flutterWebViewTempInside = new FlutterNativeWeb(
      onWebCreated: onWebCreatedTempInside,
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
        Factory<OneSequenceGestureRecognizer>(
          () => TapGestureRecognizer(),
        ),
      ].toSet(),
    );

    FlutterNativeWeb flutterWebViewTempOutside = new FlutterNativeWeb(
      onWebCreated: onWebCreatedTempOutside,
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
        Factory<OneSequenceGestureRecognizer>(
          () => TapGestureRecognizer(),
        ),
      ].toSet(),
    );

    FlutterNativeWeb flutterWebViewHumiOutside = new FlutterNativeWeb(
      onWebCreated: onWebCreatedHumiOutside,
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
        Factory<OneSequenceGestureRecognizer>(
          () => TapGestureRecognizer(),
        ),
      ].toSet(),
    );

    FlutterNativeWeb flutterWebViewCarboninside = new FlutterNativeWeb(
      onWebCreated: onWebCreatedCarboninside,
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
        Factory<OneSequenceGestureRecognizer>(
          () => TapGestureRecognizer(),
        ),
      ].toSet(),
    );

    FlutterNativeWeb flutterWebViewLightinside = new FlutterNativeWeb(
      onWebCreated: onWebCreatedLightinside,
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
        Factory<OneSequenceGestureRecognizer>(
          () => TapGestureRecognizer(),
        ),
      ].toSet(),
    );

    return Scaffold(
      body: ListView(
        children: <Widget>[
          // Container(
          // child: Text('Test'),
          Column(
            children: <Widget>[
              Container(
                child: flutterWebView,
                height: 300.0,
                width: 500.0,
              ),
              Container(
                child: flutterWebViewGadeTem,
                height: 300.0,
                width: 500.0,
              ),
              Container(
                child: flutterWebViewHumiInside,
                height: 300.0,
                width: 500.0,
              ),
              Container(
                child: flutterWebViewTempInside,
                height: 300.0,
                width: 500.0,
              ),
              Container(
                child: flutterWebViewTempOutside,
                height: 300.0,
                width: 500.0,
              ),
              Container(
                child: flutterWebViewHumiOutside,
                height: 300.0,
                width: 500.0,
              ),
              Container(
                child: flutterWebViewCarboninside,
                height: 300.0,
                width: 500.0,
              ),
              Container(
                child: flutterWebViewLightinside,
                height: 300.0,
                width: 500.0,
              )
            ],
          ),
        ],
      ),
    );
  }
}
