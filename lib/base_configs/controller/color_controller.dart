import 'package:cmsocpp/base_configs/configs/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/base/base_controller.dart';
import '../../app/data/models/color/dynamic_color_model.dart';
import '../configs/color_config.dart';
import '../repository/color_repository.dart';

class ColorController extends ServiceController implements ColorConfig {
  final BaseColorRepository _repository;

  ColorController({required BaseColorRepository repository}) : _repository = repository;

  @override
  DynamicColorModel<AppColors> get colorScheme => _repository.colorScheme;

  @override
  DynamicColorModel<Color> get primary => _repository.primary;
}
