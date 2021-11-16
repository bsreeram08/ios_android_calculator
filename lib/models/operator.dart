import 'package:flutter/material.dart';

abstract class Operator<T> {
  late final String name, displayName;
  late final T value;
  late final int precidenceValue;
  late final Widget widget;
  int get requiredParams;
  Operator? operation<U>({
    required Operator<U> a,
    required Operator<U> b,
  });
}
