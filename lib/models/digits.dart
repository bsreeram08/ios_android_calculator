import 'dart:convert';
import './operator.dart';

class Digits extends Operator<double> {
  @override
  Operator operation<Null>({Operator? a, Operator? b}) {
    print("Digits Cannot Execute Any Operation.");
    throw new Exception("Cannot Execute Any Operation.");
  }

  @override
  final int requiredParams = 0;
  @override
  final double value;
  @override
  final String displayName, name;

  Digits({
    required this.displayName,
    required this.name,
    required this.value,
  });

  Digits copyWith({
    String? displayName,
    String? name,
    double? value,
  }) {
    return Digits(
      displayName: displayName ?? this.displayName,
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'name': name,
      'value': value,
    };
  }

  factory Digits.fromMap(Map<String, dynamic> map) {
    return Digits(
      displayName: map['displayName'],
      name: map['name'],
      value: double.parse(map['value']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Digits.fromJson(String source) => Digits.fromMap(json.decode(source));

  @override
  String toString() =>
      'Digits(displayName: $displayName, name: $name, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Digits &&
        other.displayName == displayName &&
        other.name == name &&
        other.value == value;
  }

  @override
  int get hashCode => displayName.hashCode ^ name.hashCode ^ value.hashCode;

  @override
  set displayName(String _displayName) => displayName = _displayName;

  @override
  set name(String _name) => name = _name;

  @override
  set value(_value) => value = _value;
}
