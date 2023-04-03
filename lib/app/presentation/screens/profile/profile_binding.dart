import 'package:cmsocpp/app/presentation/screens/profile/profile_controller.dart';
import 'package:cmsocpp/core/base/base_bindings.dart';

class ProfileBinding extends ScreenBindings {
  @override
  void dependencies() {
    ScreenBindings.put(ProfileController());
  }
}
