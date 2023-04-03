import 'package:flutter/material.dart';

import '../../../../../core/base/base_controller.dart';
import '../repository/theme_repository.dart';

class ThemeController extends ServiceController {
  final BaseThemeRepository _repository;

  ThemeController({required BaseThemeRepository repository}) : _repository = repository;

  ThemeData getTheme({required ColorScheme colorScheme, required TextTheme textTheme}) => _repository.getTheme(colorScheme: colorScheme, textTheme: textTheme);
}
