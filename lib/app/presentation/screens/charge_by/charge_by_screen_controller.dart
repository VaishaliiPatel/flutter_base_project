import 'package:cmsocpp/app/data/models/validate_charger/validate_charger.dart';
import 'package:cmsocpp/app/presentation/screens/charging_details/charging_details_screen.dart';
import 'package:cmsocpp/app/presentation/screens/map/map_controller.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/base_configs/controller/utility_controller.dart';
import 'package:cmsocpp/core/base/base_controller.dart';
import 'package:cmsocpp/core/base/base_instance.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:cmsocpp/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ChargeByScreenController extends ScreenController with GetTickerProviderStateMixin {
  final UtilityController _utility;
  TabController? _tabController;
  String _chargerCode = '';
  String chargerName = '';
  final RxString _parsedSelectedTime = '00 : 00'.obs;

  RxString get parsedTime => _parsedSelectedTime;
  int taskId = 0;
  int transactionId = 0;
  int apiCallCounter = 0;
  double _selectedAmount = 0.0;

  TabController get tabController => _tabController!; // It is mandatory initialize with one value from listType
  ConnectorId _selectedConnector = const ConnectorId();

  ConnectorId get selectedConnector => _selectedConnector;

  final Rx<double> _selectedTime = 0.0.obs;

  double get selectedTime => _selectedTime.value;
  final Rx<double> _selectedEnergy = 0.0.obs;

  double get selectedEnergy => _selectedEnergy.value;

  // For connector list
  List<ConnectorId> _connectors = <ConnectorId>[];

  List<ConnectorId> get connectors => _connectors;

  // For API call
  final Rx<bool> _isLoading = false.obs;

  Rx<bool> get isLoading => _isLoading;
  String _selectedTimeParsed = '00:00';
  String chargePerUnit = '0.0';
  List<String> amountOptions = ['100', '200', '300', '400'];
  TextEditingController amountController = TextEditingController();
  ChargeBy chargingType = ChargeBy.energy;
  double payableAmount = 0;

  ChargeByScreenController._() : _utility = BaseInstance.get();

  factory ChargeByScreenController() {
    return ChargeByScreenController._();
  }

  @override
  void onInit() {
    _tabController = TabController(length: 3, vsync: this);
    _chargerCode = Get.arguments[ArgumentsConfig.chargerId];
    _connectors = Get.arguments[ArgumentsConfig.connectorList];
    chargerName = Get.arguments[ArgumentsConfig.chargerName];
    chargePerUnit = Get.arguments[ArgumentsConfig.chargePerUnit];
    try {
      _selectedConnector =
          _connectors.firstWhere((element) => element.connectorStatus == ConnectorStatus.available.value);
    } catch (e) {
      onBackPress();
    }
    super.onInit();
  }

  // Change charger connector
  void setSelectedConnector(ConnectorId value) {
    _selectedConnector = value;
  }

  parseTime(double time) {
    var timeInSecond = time * 3600;
    var duration = Duration(seconds: timeInSecond.floor());
    int minute = duration.inMinutes.remainder(60);
    int hour = duration.inHours;
    _selectedTimeParsed = '${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}';
    return _parsedSelectedTime.value = '${hour.toString().padLeft(2, "0")} : ${minute.toString().padLeft(2, "0")}';
  }

  // Timer pointer value change
  void handleTimePointerValueChanging(ValueChangingArgs args, ChargeByScreenController controller) {
    chargingType = ChargeBy.time;
    _selectedTime.value = args.value;
    parseTime(args.value);
  }

  // Energy pointer value change
  void handleEnergyPointerValueChanging(ValueChangingArgs args, ChargeByScreenController controller) {
    chargingType = ChargeBy.energy;
    _selectedEnergy.value = args.value;
    payableAmount = selectedEnergy.toPrecision(2) * double.parse(chargePerUnit);
  }

  void handleAmountValue(String value) {
    chargingType = ChargeBy.amount;
    _selectedAmount = double.parse(amountController.text);
  }

  // Stat Transaction API integration
  void onStartTransaction() {
    CommonMethods.hideKeyBoard();
    if (selectedEnergy.toPrecision(2) < 0.01 && selectedTime < 0.01 && _selectedAmount < 1.0) {
      CommonMethods.showSnackBarError(StringConfig.selectTimeErrorMessage);
      return;
    }
    try {
      _isLoading.value = true;
      _utility.api
          .startTransaction(
        chargerCode: _chargerCode,
        connectorNo: selectedConnector.connectorId!,
        chargeBy: CommonMethods.getSelectedChargeByType(chargingType),
        energy: selectedEnergy.toPrecision(2),
        time: _selectedTimeParsed,
        amount: _selectedAmount,
      )
          .then((value) {
        if (value.status == 1 && value.data != null) {
          taskId = value.data!.taskId!;
          Future.delayed(
            const Duration(seconds: 1),
            () {
              _isLoading.value = false;
              apiCallCounter = 1;
              // API call for get start transaction status if start transaction is successful
              getStartTransactionStatus();
            },
          );
        } else {
          _isLoading.value = false;
          onBackPress();
          CommonMethods.showSnackBarError(value.message!);
        }
      }).catchError((error) {
        _isLoading.value = false;
      });
    } catch (error) {
      _isLoading.value = false;
    }
  }

  // API call for get start transaction status
  void getStartTransactionStatus() {
    _isLoading.value = true;
    _utility.api.getStartTransactionStatus(taskId: taskId).then((statusValue) {
      if (statusValue.status == 1 && statusValue.data != null) {
        // If status is success then go to next screen
        if (statusValue.data!.taskStatus == StringConfig.successStatus) {
          _isLoading.value = false;
          transactionId = statusValue.data!.transactionId!;
          _utility.localStorage.setTaskId(taskId);
          _utility.localStorage.setChargerName(chargerName);
          navigateToChargingDetail();
          // If status is waiting then api call again after 4 second
        } else if (statusValue.data!.taskStatus == StringConfig.waitingStatus) {
          apiCallCounter = apiCallCounter + 1;
          Future.delayed(
            const Duration(seconds: 2),
            () {
              _isLoading.value = false;
              // After 1 min start transaction get status API call terminate
              if (apiCallCounter == 15) {
                apiCallCounter = 0;
                _isLoading.value = false;
                Get.back();
                CommonMethods.showSnackBarError(StringConfig.unexpectedError);
                return;
              }
              // API call for get start transaction status if start transaction is successful
              getStartTransactionStatus();
            },
          );
          // If status is error then show error toast
        } else {
          _isLoading.value = false;
          onBackPress();
          CommonMethods.showSnackBarError(statusValue.message!);
        }
      } else {
        _isLoading.value = false;
        onBackPress();
        CommonMethods.showSnackBarError(statusValue.message!);
      }
    }).catchError((error) {
      _isLoading.value = false;
    });
  }

  // Navigate to charging detail screen
  void navigateToChargingDetail() {
    var finalTime = 0.0;
    if (chargingType == ChargeBy.time) {
      var timeInSecond = selectedTime * 3600;
      var duration = Duration(seconds: timeInSecond.floor());
      int second = duration.inSeconds.remainder(60);
      var time = timeInSecond - second;
      finalTime = time / 3600;
    }
    Get.off(() => const ChargingDetailsScreen(), arguments: {
      ArgumentsConfig.chargerId: _chargerCode,
      ArgumentsConfig.transactionId: 0,
      ArgumentsConfig.chargeByType: chargingType,
      ArgumentsConfig.selectedTime: finalTime,
      ArgumentsConfig.selectedEnergy: selectedEnergy,
      ArgumentsConfig.selectedAmount: _selectedAmount,
      ArgumentsConfig.chargerName: chargerName,
      ArgumentsConfig.taskId: taskId,
      ArgumentsConfig.isFromChargeByScreen: true
    });
  }

  // Back navigation
  void onBackPress() {
    MapController mapController = BaseInstance.get();
    mapController.onRefreshClick();
    Get.back(closeOverlays: true);
  }

  // On back from mobile back button
  Future<bool> onWillPop() async {
    onBackPress();
    return true;
  }

  @override
  BaseFlavorConfig get flavor => _utility.flavor.currentFlavor;

  @override
  StyleController get styles => _utility.style;
}
