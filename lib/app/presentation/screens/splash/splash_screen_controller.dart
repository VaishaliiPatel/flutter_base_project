import 'dart:async';

import 'package:cmsocpp/app/presentation/screens/home/home_screen.dart';
import 'package:cmsocpp/app/presentation/screens/login/login_screen.dart';
import 'package:cmsocpp/base_configs/configs/flavor_config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/base_configs/controller/utility_controller.dart';
import 'package:cmsocpp/core/base/base_controller.dart';
import 'package:cmsocpp/core/base/base_instance.dart';
import 'package:get/get.dart';

class SplashScreenController extends ScreenController {
  final UtilityController _utility;

  SplashScreenController._()
      : _utility = BaseInstance.get();

  @override
  void onInit() {
    _utility.localStorage.saveIndexKey(0);
    _navigateToLoginScreen();
    super.onInit();
  }

  factory SplashScreenController() {
    return SplashScreenController._();
  }

  // To navigate to auth screen
  Future<void> _navigateToLoginScreen() async {
    Future.delayed(const Duration(seconds: 3), () {
      if (_utility.localStorage.getIsUserLoggedIn()!) {
        Get.off(() => const HomeScreen());
      } else {
        Get.off(() => const LoginScreen());
      }
    });
  }

  @override
  BaseFlavorConfig get flavor => _utility.flavor.currentFlavor;

  @override
  StyleController get styles => _utility.style;
}
