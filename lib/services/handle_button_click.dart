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

void handleEquationStream(String data) {
  if (!validateEquation(data)) {
    return;
  }
  print("Here to handle stream listn");
}

bool validateEquation(String equation) {
  List<String> digits = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
    'π',
  ];
  List<String> ops = [
    '+',
    '-',
    '×',
    '/',
    '%',
    '^',
    '√',
    '!',
    '(',
    ')',
  ];
  List<String> addOps = [
    'INV',
    'sin(',
    'cos(',
    'tan(',
    'ln(',
    'log(',
  ];
  List<String> valStack = [];
  List<String> opsStack = [];
  String temp = '';
  for (var iter = 0; iter < equation.length; iter++) {
    print(valStack);
    print(opsStack);
    final v = equation[iter];
    if (digits.contains(v)) {
      print("Digit");
      temp = '$temp$v';
    } else {
      print("Operator");
      if (temp != '') valStack.add(temp);
      temp = '';
      if (ops.contains(v)) {
        opsStack.add(v);
      } else if (addOps.contains(v)) {
        opsStack.add(v);
        print("Additional Operators");
        print("Not handled");
      }
    }
  }
  return false;
}
