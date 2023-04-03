import 'package:cmsocpp/core/base/base_bindings.dart';
import 'charging_details_screen_controller.dart';

class ChargingDetailsScreenBinding extends ScreenBindings {
  @override
  void dependencies() {
    ScreenBindings.put(ChargingDetailsScreenController());
  }
}