import 'package:flutter/material.dart';
import 'package:ios_android_calculator/services/services.dart';
import 'package:ios_android_calculator/services/handler_functions.dart';
class RoundedButton extends StatelessWidget {
  Widget dataWidget;
  Color circleColor;
  String label;
  RoundedButton({
    required this.dataWidget,
    required this.circleColor,
    required this.label,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      child: FlatButton(
        onPressed: () {
          handleButtonBottomPanelClick(this.label);
          print("Tapped : ${this.label}");
        },
        child: Center(
          child: dataWidget,
        ),
      ),
      decoration: BoxDecoration(
        color: circleColor,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
    );
  }
}
