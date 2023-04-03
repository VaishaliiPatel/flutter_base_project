import 'package:cmsocpp/core/base/base_bindings.dart';
import 'qr_scanner_screen_controller.dart';

class QrScannerScreenBinding extends ScreenBindings {
  @override
  void dependencies() {
    ScreenBindings.put(QrScannerScreenController());
  }
}