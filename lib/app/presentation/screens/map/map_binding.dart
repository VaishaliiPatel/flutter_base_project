import 'package:cmsocpp/app/presentation/screens/map/map_controller.dart';
import 'package:cmsocpp/core/base/base_bindings.dart';


class MapBinding extends ScreenBindings {
  @override
  void dependencies() {
    ScreenBindings.put(MapController());
  }
}
