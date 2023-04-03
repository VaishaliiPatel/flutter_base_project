import 'package:flutter/material.dart';

class DynamicColorModel<T> {
  final T light;
  final T dark;

  T get(Brightness brightness) {
    return brightness == Brightness.light ? light : dark;
  }

  const DynamicColorModel({required this.light, required this.dark});
}