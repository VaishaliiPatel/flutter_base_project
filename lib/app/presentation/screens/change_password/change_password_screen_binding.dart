import 'package:cmsocpp/core/base/base_bindings.dart';

import 'change_password_screen_controller.dart';

class ChangePasswordScreenBinding extends ScreenBindings {
  @override
  void dependencies() {
    ScreenBindings.put(ChangePasswordScreenController());
  }
}
