import 'package:flutter/material.dart';
import 'package:ios_android_calculator/style/styles.dart';
import 'package:ios_android_calculator/services/handler_functions.dart';

class BlackText extends StatelessWidget {
  final String text;
  final String label;
  BlackText({
    required this.text,
    required this.label,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(label);
        handleTopPannelButtonClick(label);
      },
      child: Container(
        color: Colors.transparent,
        width: 50,
        height: 50,
        child: Center(
          child: Text(
            text,
            style: PrimaryButtonFonts.additionalOptions,
          ),
        ),
      ),
    );
  }
}
