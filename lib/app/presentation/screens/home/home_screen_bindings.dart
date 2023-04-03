import '../../../../../core/base/base_bindings.dart';
import 'home_screen_controller.dart';

class HomeScreenBindings extends ScreenBindings {
  @override
  void dependencies() {
    ScreenBindings.put(HomeScreenController());
  }
}
