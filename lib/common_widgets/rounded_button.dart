import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  Widget dataWidget;
  Color circleColor;
  RoundedButton({
    required this.dataWidget,
    required this.circleColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      child: Center(
        child: dataWidget,
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
