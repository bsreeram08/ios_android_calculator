import 'package:flutter/material.dart';
import 'package:ios_android_calculator/pages/pages.dart';

class TopViewPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ResultView(),
          ),
          Expanded(
            child: AdditionalInputs(),
          ),
        ],
      ),
    );
  }
}
