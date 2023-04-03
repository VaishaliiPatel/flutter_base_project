import 'package:cmsocpp/app/presentation/screens/splash/splash_screen_controller.dart';
import 'package:cmsocpp/core/base/base_bindings.dart';

class SplashScreenBinding extends ScreenBindings {
  @override
  void dependencies() {
    ScreenBindings.put(SplashScreenController());
  }
}
