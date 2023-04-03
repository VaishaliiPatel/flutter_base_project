import 'package:get/get.dart';

import '../configs/navigation_config.dart';
import '../../app/data/models/navigation/navigation_model.dart';

abstract class BaseNavigationRepository {
  NavigationModel get home;
  NavigationModel get splash;
  NavigationModel get login;
  NavigationModel get resetPassword;
  NavigationModel get register;
  NavigationModel get otp;
  NavigationModel get qrScanner;
  NavigationModel get chargingDetails;
  NavigationModel get chargeBy;


  String get currentRoute;
  NavigationModel get initialRoute;
  List<NavigationModel> get availableNavigation;
}

class NavigationRepository extends BaseNavigationRepository {
  @override
  NavigationModel get home => NavigationConfig.home;

  @override
  String get currentRoute => Get.currentRoute;

  @override
  NavigationModel get initialRoute => NavigationConfig.initialRoute;

  @override
  List<NavigationModel> get availableNavigation => NavigationConfig.availableNavigation;

  @override
  NavigationModel get splash => NavigationConfig.splash;

  @override
  NavigationModel get login => NavigationConfig.login;

  @override
  NavigationModel get resetPassword => NavigationConfig.resetPassword;

  @override
  NavigationModel get register => NavigationConfig.register;

  @override
  NavigationModel get otp => NavigationConfig.otp;

  @override
  NavigationModel get qrScanner => NavigationConfig.qrScanner;

  @override
  NavigationModel get chargingDetails => NavigationConfig.chargingDetails;

  @override
  NavigationModel get chargeBy => NavigationConfig.chargeBy;
}
