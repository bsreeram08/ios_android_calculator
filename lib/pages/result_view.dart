import 'package:flutter/material.dart';
import 'package:ios_android_calculator/pages/pages.dart';
import 'package:ios_android_calculator/style/styles.dart';
import 'package:ios_android_calculator/services/services.dart';

class ResultView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            Icons.menu,
            color: Colors.white,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: StreamBuilder<String>(
              stream: Global.equationBs,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    '${snapshot.data}',
                    style: PrimaryTextFonts.panelText,
                  );
                }
                return Text(
                  'SRB',
                  style: PrimaryTextFonts.panelText,
                );
              },
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: StreamBuilder<String>(
                stream: Global.resultBs,
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      '${snapshot.data}',
                      style: PrimaryTextFonts.resultText,
                    );
                  }
                  return Text('SRB');
                }),
          ),
          Container(),
        ],
      ),
    );
  }
}
