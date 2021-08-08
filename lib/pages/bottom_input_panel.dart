import 'package:flutter/material.dart';
import 'package:ios_android_calculator/style/styles.dart';
import 'package:ios_android_calculator/common_widgets/common_widgets.dart';

class BottomInputPanel extends StatelessWidget {
  final Color primaryPanelColor, rightSidePanelColor, topPanelColor;
  final List<Widget> rows = [];
  BottomInputPanel({
    required this.primaryPanelColor,
    required this.rightSidePanelColor,
    required this.topPanelColor,
  }) {
    final List<Widget> listOfToggles = ['C', 'e', '%']
        .map(
          (data) => RoundedButton(
            label: data,
            dataWidget: Text(
              data,
              style: PrimaryButtonFonts.primaryBlack,
            ),
            circleColor: ButtonColors.toggleButtonColor,
          ),
        )
        .toList();
    final List<Widget> listOfRightPanel = ['/', '×', '-', '+']
        .map(
          (data) => RoundedButton(
            label: data,
            dataWidget: Text(
              data,
              style: PrimaryButtonFonts.primaryWhite,
            ),
            circleColor: ButtonColors.rightPanelButtonColor,
          ),
        )
        .toList();
    listOfRightPanel.insert(
      0,
      RoundedButton(
        label: 'Backspace',
        dataWidget: Icon(
          Icons.backspace,
          color: Colors.white,
        ),
        circleColor: ButtonColors.rightPanelButtonColor,
      ),
    );
    final List<Widget> numberPanel =
        ['7', '8', '9', '4', '5', '6', '1', '2', '3', '0', '.', '=']
            .map((data) => RoundedButton(
                  label: data,
                  dataWidget: Text(
                    data,
                    style: PrimaryButtonFonts.primaryWhite,
                  ),
                  circleColor: ButtonColors.numberButtonColor,
                ))
            .toList();
    final List<Widget> listOfItems = [
      ...listOfToggles,
      ...numberPanel,
    ];
    for (var iter = 0; iter < listOfRightPanel.length; iter++) {
      listOfItems.insert((3 * (iter + 1) + (1 * iter)), listOfRightPanel[iter]);
    }

    for (var iter1 = 0; iter1 < listOfItems.length; iter1 += 4) {
      final List<Widget> tempList = [];
      for (var iter2 = iter1; iter2 < iter1 + 4; iter2++) {
        tempList.add(
          listOfItems[iter2],
        );
      }
      rows.add(
        Row(
          children: tempList,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: rows,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    );
  }
}
