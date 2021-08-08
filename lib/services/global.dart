import 'package:rxdart/rxdart.dart';

class Global {
  static BehaviorSubject<String> resultBs = new BehaviorSubject<String>.seeded('');
  static BehaviorSubject<String> equationBs = new BehaviorSubject<String>.seeded('');
}


