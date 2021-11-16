import 'dart:convert';
import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:ios_android_calculator/models/models.dart';
import './operator.dart';

enum CompoundOperatorsEnum {
  SIN,
  COS,
  TAN,
  SIN_INV,
  COS_INV,
  TAN_INV,
  SQ_ROOT,
  LOG,
  LN,
  PERCENT,
  CLEAR,
  DELETE,
}

Operator<double>? calculateCompoundOperation({
  required Operator<double> a,
  required CompoundOperatorsEnum operation,
}) {
  switch (operation) {
    case CompoundOperatorsEnum.SIN:
      a.value = Math.sin(a.value);
      break;
    case CompoundOperatorsEnum.COS:
      a.value = Math.cos(a.value);
      break;
    case CompoundOperatorsEnum.TAN:
      a.value = Math.tan(a.value);
      break;
    case CompoundOperatorsEnum.SIN_INV:
      a.value = Math.asin(a.value);
      break;
    case CompoundOperatorsEnum.COS_INV:
      a.value = Math.acos(a.value);
      break;
    case CompoundOperatorsEnum.TAN_INV:
      a.value = Math.atan(a.value);
      break;
    case CompoundOperatorsEnum.SQ_ROOT:
      a.value = Math.sqrt(a.value);
      break;
    case CompoundOperatorsEnum.LOG:
      a.value = Math.log(a.value);
      break;
    case CompoundOperatorsEnum.LN:
      a.value = Math.log(a.value) / Math.log(Math.e);
      break;
    case CompoundOperatorsEnum.PERCENT:
      a.value = a.value * 100;
      break;
    case CompoundOperatorsEnum.DELETE:
      return null;
    default:
      throw new Exception("We do not support the operation.");
  }
  return a;
}

class CompoundSingleOperator extends Operator<CompoundOperatorsEnum> {
  @override
  late String displayName, name;
  @override
  late int precidenceValue;
  @override
  Widget widget;
  @override
  late CompoundOperatorsEnum value;
  CompoundSingleOperator({
    required this.displayName,
    required this.name,
    required this.value,
    required this.precidenceValue,
    required this.widget,
  });
  @override
  int get requiredParams => 1;

  @override
  Operator? operation<double>({
    required Operator<double> a,
    Operator<double>? b,
  }) {
    return calculateCompoundOperation(
      a: a,
      operation: this.value,
    );
  }

  CompoundSingleOperator copyWith({
    String? displayName,
    String? name,
    CompoundOperatorsEnum? value,
    int? precidenceValue,
    Widget? widget,
  }) {
    return CompoundSingleOperator(
      displayName: displayName ?? this.displayName,
      widget: widget ?? this.widget,
      name: name ?? this.name,
      value: value ?? this.value,
      precidenceValue: precidenceValue ?? this.precidenceValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
      'displayName': displayName,
      'requiredParams': requiredParams,
      'precidenceValue': precidenceValue,
    };
  }

  factory CompoundSingleOperator.fromMap(Map<String, dynamic> map) {
    return CompoundSingleOperator(
      widget: map['widget'],
      name: map['name'],
      value: map['value'],
      precidenceValue: map['precidenceValue'],
      displayName: map['displayName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CompoundSingleOperator.fromJson(String source) =>
      CompoundSingleOperator.fromMap(json.decode(source));

  @override
  String toString() => 'CompoundOperator(name: $name, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CompoundSingleOperator &&
        other.name == name &&
        other.value == value &&
        other.precidenceValue == precidenceValue &&
        other.widget == widget &&
        other.displayName == displayName;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      value.hashCode ^
      displayName.hashCode ^
      widget.hashCode ^
      precidenceValue.hashCode ^
      requiredParams.hashCode;
}
