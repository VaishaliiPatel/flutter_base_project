import 'package:cmsocpp/core/base/base_bindings.dart';

import 'history_controller.dart';

class HistoryBinding extends ScreenBindings {
  @override
  void dependencies() {
    ScreenBindings.put(HistoryScreenController());
  }
}
