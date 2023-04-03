import 'package:cmsocpp/base_configs/controller/color_controller.dart';

import 'package:cmsocpp/base_configs/controller/style_controller.dart';

import '../../../../../core/base/base_controller.dart';
import '../../app/data/network/api_controller.dart';
import 'firebase_controller.dart';
import 'flavor_controller.dart';
import 'font_controller.dart';
import 'local_storage_controller.dart';
import 'navigation_controller.dart';
import 'theme_controller.dart';

class UtilityController extends ServiceController {
  final FirebaseController firebase;
  final NavigationController navigation;
  final LocalStorageController localStorage;
  final ThemeController theme;
  final FontController font;
  final ApiController api;
  final FlavorController flavor;
  final ColorController color;
  final StyleController style;

  UtilityController()
      : firebase = ServiceController.get(),
        navigation = ServiceController.get(),
        localStorage = ServiceController.get(),
        theme = ServiceController.get(),
        font = ServiceController.get(),
        api = ServiceController.get(),
        flavor = ServiceController.get(),
        color = ServiceController.get(),
        style = ServiceController.get();
}
