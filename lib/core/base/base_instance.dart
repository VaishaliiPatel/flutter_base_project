import 'package:get/get.dart';

import 'base_controller.dart';

class BaseInstance {
  BaseInstance._();

  static void _putInstance<T>(T controller) {
    if (controller is ScreenController) {
      Get.lazyPut<T>(() => controller);
    } else {
      Get.put<T>(controller);
    }
  }

  static T _getInstance<T>() => Get.find();

  static void put<T>(T controller) => _putInstance<T>(controller);

  static T get<T>() => _getInstance();
}
