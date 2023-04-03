import 'dart:convert';

import 'package:cmsocpp/app/data/models/history/history.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/base_configs/controller/utility_controller.dart';
import 'package:cmsocpp/core/base/base_controller.dart';
import 'package:get/get.dart';

class HistoryDetailScreenController extends ScreenController {
  late UtilityController _utility;

  Datum historyData = const Datum();

  @override
  void onInit() {
    _utility = ScreenController.get();
    String data = Get.arguments[ArgumentsConfig.historyData] ?? '';
    historyData = Datum.fromJson(json.decode(data));
    super.onInit();
  }

  void onBackPress() {
    Get.back();
  }

  @override
  BaseFlavorConfig get flavor => _utility.flavor.currentFlavor;

  @override
  StyleController get styles => _utility.style;
}
