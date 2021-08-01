import 'package:flutter/material.dart';
import 'package:ios_android_calculator/common_widgets/common_widgets.dart';
import 'package:ios_android_calculator/style/styles.dart';
import 'package:ios_android_calculator/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenPageState createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            BottomInputPanel(
              primaryPanelColor: Color(0xff333333),
              rightSidePanelColor: Color(0xffFF9D00),
              topPanelColor: Color(0xffA5A5A5),
            ),
          ],
        ),
      ),
    );
  }
}
