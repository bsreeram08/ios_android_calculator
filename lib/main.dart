import 'package:flutter/material.dart';
import 'package:ios_android_calculator/common_widgets/common_widgets.dart';
import 'package:ios_android_calculator/style/styles.dart';
import 'package:ios_android_calculator/pages/pages.dart';
import 'package:ios_android_calculator/services/services.dart';
import 'package:ios_android_calculator/services/handler_functions.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Global.equationBs.listen((data) => handleEquationStream(data));
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: TopViewPanel(),
              ),
              Expanded(
                child: BottomInputPanel(
                  primaryPanelColor: Color(0xff333333),
                  rightSidePanelColor: Color(0xffFF9D00),
                  topPanelColor: Color(0xffA5A5A5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
