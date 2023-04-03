import 'package:cmsocpp/app/presentation/screens/settings/settings_controller.dart';
import 'package:cmsocpp/core/base/base_bindings.dart';
import 'package:get/get.dart';


class SettingsBinding extends ScreenBindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsScreenController());
  }
}
