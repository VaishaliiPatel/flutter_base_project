import 'package:cmsocpp/app/presentation/screens/register/register_screen_controller.dart';
import 'package:cmsocpp/core/base/base_bindings.dart';

class RegisterScreenBinding extends ScreenBindings {
  @override
  void dependencies() {
   ScreenBindings.put(RegisterScreenController());
  }
}
