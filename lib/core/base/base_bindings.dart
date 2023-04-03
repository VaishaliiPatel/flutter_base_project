import 'package:get/get.dart';

import 'base_instance.dart';

abstract class BaseBindings extends Bindings {}

abstract class ScreenBindings extends BaseBindings {
  static void put<T>(T controller) => BaseInstance.put(controller);
}
