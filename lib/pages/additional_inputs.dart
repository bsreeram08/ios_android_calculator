import 'package:flutter/material.dart';
import 'package:ios_android_calculator/common_widgets/common_widgets.dart';

class AdditionalInputs extends StatelessWidget {
  late final List<Widget> optionsWidgets;
  AdditionalInputs() {
    final List<String> optionsString = [
      'INV',
      'sin',
      'cos',
      'tan',
      'ln',
      'log',
      '√',
      '^',
      'π',
      '(',
      ')',
      '!',
    ];
    optionsWidgets = optionsString
        .map(
          (data) => Center(
            child: BlackText(
              text: data,
              label: data,
            ),
          ),
        )
        .toList();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFA5A5A5),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        crossAxisCount: 4,
        shrinkWrap: true,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 3.3),
        children: this.optionsWidgets,
      ),
    );
  }
}
