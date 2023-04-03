import 'package:cmsocpp/app/presentation/screens/login/login_screen_controller.dart';
import 'package:cmsocpp/core/base/base_bindings.dart';

class LoginScreenBinding extends ScreenBindings {
  @override
  void dependencies() {
    ScreenBindings.put(LoginScreenController());
  }
}
