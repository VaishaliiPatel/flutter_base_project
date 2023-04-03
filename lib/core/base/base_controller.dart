import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:get/get.dart';

import '../../base_configs/controller/style_controller.dart';
import 'base_instance.dart';

abstract class BaseController extends GetxController {}

abstract class ServiceController extends BaseController {
  static T get<T>() => BaseInstance.get();
}

abstract class ScreenController extends BaseController {
  static T get<T>() => BaseInstance.get();

  BaseFlavorConfig get flavor;

  StyleController get styles;


}
