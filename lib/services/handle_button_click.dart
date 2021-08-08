import 'package:ios_android_calculator/services/services.dart';

void handleButtonBottomPanelClick(String data) async {
  if (data == '%') {
    String prevString = await Global.resultBs.value;
    String res = '$prevString$data';
    Global.resultBs.add(res);
    return;
  }
  String prevString = await Global.equationBs.value;
  String resultData = await Global.resultBs.value;
  String res = '';
  if (data == 'Backspace') {
    if (prevString == '') return;
    res = prevString.substring(0, prevString.length - 1);
  } else if (data == 'C') {
    Global.equationBs.add('');
    Global.resultBs.add('');
  } else if (data == '=') {
    res = resultData;
    Global.resultBs.add('');
  } else
    res = '$prevString$data';
  Global.equationBs.add(res);
}

void handleTopPannelButtonClick(String data) async {
  String prevData = await Global.equationBs.value;
  String resultData = await Global.resultBs.value;
  if (data == 'INV') {
    if (prevData.length < 1) {
      return;
    } else if (resultData[0] == '-') {
      Global.resultBs.add(resultData.substring(1));
    } else
      Global.resultBs.add('-$resultData');
  } else {
    Global.equationBs.add('$prevData$data');
  }
}

void handleEquationStream(String data){
  print("Here to handle stream listn");
}
