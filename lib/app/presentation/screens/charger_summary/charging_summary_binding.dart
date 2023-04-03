import 'package:cmsocpp/app/presentation/screens/charger_summary/charging_summary_controller.dart';
import 'package:cmsocpp/core/base/base_bindings.dart';

class ChargingSummaryBinding extends ScreenBindings {
  @override
  void dependencies() {
    ScreenBindings.put(ChargingSummaryController());
  }
}