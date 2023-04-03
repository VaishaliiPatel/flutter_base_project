import 'package:cmsocpp/app/data/models/charging_summery/charging_summary.dart';
import 'package:cmsocpp/app/presentation/screens/map/map_controller.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/base_configs/controller/utility_controller.dart';
import 'package:cmsocpp/core/base/base_controller.dart';
import 'package:cmsocpp/core/base/base_instance.dart';
import 'package:get/get.dart';

class ChargingSummaryController extends ScreenController {
  late UtilityController utility;
  String usedEnergyUnit = 'KW';
  String usedTimeUnit = 'Hr';
  String chargerName = '';
  int transactionId = 0;
  final RxBool _isLoading = false.obs;

  RxBool get isLoading => _isLoading;
  RxList<Map<String, dynamic>> chargingDetails = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    utility = ScreenController.get();
    transactionId = Get.arguments[ArgumentsConfig.transactionId];
    chargerName = Get.arguments[ArgumentsConfig.chargerName];
    getChargingSummery();
    super.onInit();
  }

  getChargingSummery() {
    _isLoading.value = true;
    utility.api.getTransactionSummery(transactionId: transactionId).then((response) {
      if (response.status == 1) {
        TransactionData chargingSummary = response.data!.transactionData!;
        chargingDetails.value = [
          // Energy
          {
            ArgumentsConfig.chargingKey: StringConfig.energyText,
            ArgumentsConfig.chargingValue: chargingSummary.energyConsume ?? '0.0',
            ArgumentsConfig.unit: usedEnergyUnit
          },
          // Time
          {
            ArgumentsConfig.chargingKey: StringConfig.durationText,
            ArgumentsConfig.chargingValue: chargingSummary.duration ?? '00:00',
            ArgumentsConfig.unit: usedTimeUnit
          },
          // Amount
          {
            ArgumentsConfig.chargingKey: StringConfig.charges,
            ArgumentsConfig.chargingValue: chargingSummary.energyCharge ?? 0.0,
            ArgumentsConfig.unit: StringConfig.rupees
          },
        ];
        _isLoading.value = false;
      } else {
        _isLoading.value = false;
        if (response.status == ApiConfig.unAuthorisedErrorCode) {
          onBackPress();
        }
      }
    }).catchError((e) {
      _isLoading.value = false;
    });
  }

  // Back from screen back button
  void onBackPress() {
    utility.localStorage.saveIndexKey(0);
    MapController mapController = BaseInstance.get();
    mapController.onRefreshClick();
    Get.back();
  }

  // On back from mobile back button
  Future<bool> onWillPop() async {
    onBackPress();
    return true;
  }

  @override
  BaseFlavorConfig get flavor => utility.flavor.currentFlavor;

  @override
  StyleController get styles => utility.style;
}
