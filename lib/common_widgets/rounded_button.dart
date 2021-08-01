import 'package:flutter/material.dart';

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
      child: FlatButton(
        onPressed: () {
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
