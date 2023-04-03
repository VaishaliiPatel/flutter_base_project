import 'package:cmsocpp/core/base/base_bindings.dart';
import 'reset_password_screen_controller.dart';

class ResetPasswordScreenBinding extends ScreenBindings {
  @override
  void dependencies() {
    ScreenBindings.put(ResetPasswordScreenController());
  }
}
