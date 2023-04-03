import 'package:flutter/material.dart';

abstract class BaseThemeConfig {
  ThemeData getTheme({required ColorScheme colorScheme, required TextTheme textTheme});
}

abstract class ThemeConfig extends BaseThemeConfig {
  @override
  ThemeData getTheme({required ColorScheme colorScheme, required TextTheme textTheme}) => ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        textTheme: textTheme
      );
}
