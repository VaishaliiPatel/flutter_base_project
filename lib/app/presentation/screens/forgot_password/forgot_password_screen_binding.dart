import 'package:cmsocpp/core/base/base_bindings.dart';
import 'forgot_password_screen_controller.dart';

class ForgotPasswordScreenBinding extends ScreenBindings {
  @override
  void dependencies() {
    ScreenBindings.put(ForgotPasswordScreenController());
  }
}
