import 'package:flutter/material.dart';

abstract class LanguageConfig {
  LanguageConfig._();

  static const Locale _enUS = Locale('en', 'US');
  static const Locale _hiIN = Locale('hi', 'IN');

  static const Locale fallbackLocale = _enUS;

  static const List<Locale> supportedLocales = [
    _enUS,
    _hiIN,
  ];
}