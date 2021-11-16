import 'dart:convert';
import 'package:flutter/material.dart';

import './operator.dart';
import 'dart:math';

enum ArthmeticOperatorsEnum { ADD, SUBTRACT, MULTIPLY, DIVIDE, POWER }

Operator calcValue(Operator a, Operator b, ArthmeticOperatorsEnum value) {
  final double value1 = a.value;
  final double value2 = b.value;
  switch (value) {
    case ArthmeticOperatorsEnum.ADD:
      a.value = value1 + value2;
      break;
    case ArthmeticOperatorsEnum.SUBTRACT:
      a.value = value1 - value2;
      break;
    case ArthmeticOperatorsEnum.MULTIPLY:
      a.value = value1 * value2;
      break;
    case ArthmeticOperatorsEnum.DIVIDE:
      a.value = value1 / value2;
      break;
    case ArthmeticOperatorsEnum.POWER:
      a.value = pow(value1, value2);
  }
  return a;
}

class ArthmeticOperators extends Operator<ArthmeticOperatorsEnum> {
  @override
  Operator operation<double>({
    required Operator<double> a,
    required Operator<double> b,
  }) {
    return calcValue(a, b, value);
  }

  @override
  String displayName;
  @override
  int requiredParams = 2;
  @override
  int precidenceValue;
  @override
  Widget widget;
  @override
  String name;
  ArthmeticOperators({
    required this.displayName,
    required this.name,
    required this.value,
    required this.precidenceValue,
    required this.widget,
  });

  @override
  ArthmeticOperatorsEnum value;

  ArthmeticOperators copyWith({
    String? displayName,
    String? name,
    int? precidenceValue,
    Widget? widget,
  }) {
    return ArthmeticOperators(
      displayName: displayName ?? this.displayName,
      name: name ?? this.name,
      value: value ?? this.value,
      precidenceValue: precidenceValue ?? this.precidenceValue,
      widget: widget ?? this.widget,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'name': name,
      'value': value,
      'precidenceValue': precidenceValue,
      'widget': 'Cannot convert widget to string.'
    };
  }

  factory ArthmeticOperators.fromMap(Map<String, dynamic> map) {
    return ArthmeticOperators(
      displayName: map['displayName'],
      name: map['name'],
      value: map['value'],
      precidenceValue: map['precidenceValue'],
      widget: map['widget'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ArthmeticOperators.fromJson(String source) =>
      ArthmeticOperators.fromMap(json.decode(source));

  @override
  String toString() =>
      'ArthmeticOperators(displayName: $displayName, name: $name, value: $value, precidenceValue: $precidenceValue, widget: $widget)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArthmeticOperators &&
        other.displayName == displayName &&
        other.name == name &&
        other.value == value &&
        other.widget == widget &&
        other.precidenceValue == precidenceValue;
  }

  @override
  int get hashCode =>
      displayName.hashCode ^
      name.hashCode ^
      value.hashCode ^
      precidenceValue.hashCode ^
      widget.hashCode;
}
