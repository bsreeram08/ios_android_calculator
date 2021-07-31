import 'package:flutter/material.dart';

class BottomInputPanel extends StatelessWidget {
  final Color primaryPanelColor, rightSidePanelColor, topPanelColor;

  BottomInputPanel({
    required this.primaryPanelColor,
    required this.rightSidePanelColor,
    required this.topPanelColor,
  });
  final List<Widget> listOfItems = [
   Text('e'),
  Text("+/-"),
 Text("%"),
 Icon(Icons.backspace,
     color: Colors.),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: listOfItems,
    );
  }
}

