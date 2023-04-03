import 'package:cmsocpp/app/presentation/screens/OTP/otp_screen_controller.dart';
import 'package:cmsocpp/core/base/base_bindings.dart';

class OTPScreeBinding extends ScreenBindings {
  @override
  void dependencies() {
    ScreenBindings.put(OTPScreenController());
  }
}
