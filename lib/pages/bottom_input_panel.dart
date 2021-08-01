import 'package:flutter/material.dart';
import 'package:ios_android_calculator/style/styles.dart';
import 'package:ios_android_calculator/common_widgets/common_widgets.dart';

class BottomInputPanel extends StatelessWidget {
  final Color primaryPanelColor, rightSidePanelColor, topPanelColor;
  late final List<Widget> listOfItems;
  BottomInputPanel({
    required this.primaryPanelColor,
    required this.rightSidePanelColor,
    required this.topPanelColor,
  }) {
    final List<Widget> listOfToggles = ['e', '+/-', '%']
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
    listOfItems = [
      ...listOfToggles,
      ...numberPanel,
    ];
    for (var iter = 0; iter < listOfRightPanel.length; iter++) {
      listOfItems.insert((3 * (iter + 1) + (1 * iter)), listOfRightPanel[iter]);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 400,
      color: Colors.black,
      child: GridView.count(
        physics: new NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(20),
        children: listOfItems,
      ),
    );
  }
}