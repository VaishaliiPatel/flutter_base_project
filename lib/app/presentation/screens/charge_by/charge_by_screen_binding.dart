import 'package:cmsocpp/core/base/base_bindings.dart';
import 'charge_by_screen_controller.dart';

class ChargeByScreenBinding extends ScreenBindings {
  @override
  void dependencies() {
    ScreenBindings.put(ChargeByScreenController());
  }
}