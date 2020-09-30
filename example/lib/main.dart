import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_ui_mode_manager/flutter_ui_mode_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UiMode _uiMode ;

  @override
  void initState() {
    super.initState();
    initDeviceUiMode();
  }


  Future<void> initDeviceUiMode() async {
    UiMode uiMode;
    try {
      uiMode = await FlutterUiModeManager.getDeviceUiMode;
    } on PlatformException {
      uiMode = null;
    }

    if (!mounted) return;

    setState(() {
      _uiMode = uiMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_uiMode\n'),
        ),
      ),
    );
  }
}
