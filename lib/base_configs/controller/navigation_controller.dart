import '../../../../../core/base/base_controller.dart';
import '../../app/data/models/navigation/navigation_model.dart';
import '../repository/navigation_repository.dart';

class NavigationController extends ServiceController {
  final NavigationModel home;
  final NavigationModel splash;
  final NavigationModel login;
  final NavigationModel resetPassword;
  final NavigationModel register;
  final NavigationModel otp;
  final NavigationModel qrScanner;
  final NavigationModel chargingDetails;
  final NavigationModel chargeBy;

  final String currentRoute;
  final NavigationModel initialRoute;
  final List<NavigationModel> availableNavigation;

  NavigationController({required BaseNavigationRepository repository})
      : home = repository.home,
        resetPassword = repository.resetPassword,
        currentRoute = repository.currentRoute,
        initialRoute = repository.initialRoute,
        availableNavigation = repository.availableNavigation,
        splash = repository.splash,
        login = repository.login,
        register = repository.register,
        otp = repository.otp,
        qrScanner = repository.qrScanner,
        chargingDetails = repository.chargingDetails,
        chargeBy = repository.chargeBy;
}
