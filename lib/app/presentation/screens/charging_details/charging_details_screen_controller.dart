import 'dart:async';

import 'package:cmsocpp/app/data/models/transaction_meter_value/transaction_meter_value_model.dart';
import 'package:cmsocpp/app/presentation/screens/charger_summary/charging_summary_screen.dart';
import 'package:cmsocpp/app/presentation/screens/map/map_controller.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/base_configs/controller/utility_controller.dart';
import 'package:cmsocpp/core/base/base_controller.dart';
import 'package:cmsocpp/core/base/base_instance.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:cmsocpp/utils/enums.dart';
import 'package:cmsocpp/utils/print_log.dart';
import 'package:get/get.dart';

class ChargingDetailsScreenController extends ScreenController with GetTickerProviderStateMixin {
  final UtilityController _utility;

  RxDouble usedEnergy = 0.0.obs;
  String usedEnergyUnit = 'KW';
  int transactionId = 0;
  String chargerCode = '';
  int taskId = 0;
  Timer? _chargingDurationTimer;
  ChargeBy chargeByType = ChargeBy.energy;
  String chargerName = '';
  bool isTransactionOn = true;
  int apiCallCounter = 0;

  RxInt hour = 0.obs;
  RxInt minute = 0.obs;
  RxInt second = 0.obs;
  Timer? _timer;

  // For count remaining value
  RxDouble remainingEnergy = 0.0.obs;
  RxDouble remainingAmount = 0.0.obs;
  RxInt remainingTime = 0.obs;

  final Rx<double> _selectedPointer = 0.0.obs;

  bool isWatchReset = false;

  int remainingSeconds = 0;
  var selectedTimeInSecond = 0;

  double get selectedPointer => _selectedPointer.value;

  // For API call
  final Rx<bool> _isLoading = false.obs;

  Rx<bool> get isLoading => _isLoading;

  // User selected value
  double _selectedTime = 0.0;

  double get selectedTime => _selectedTime;
  double _selectedEnergy = 0.0;
  double _selectedAmount = 0.0;

  double get selectedAmount => _selectedAmount;

  double get selectedEnergy => _selectedEnergy;

  Data chargingDetail = const Data();

  ChargingDetailsScreenController._() : _utility = BaseInstance.get();
  final RxBool _isTransactionStop = false.obs;

  RxBool get isTransactionStop => _isTransactionStop;

  int startTransactionTaskId = 0;
  RxBool isStartTransactionSucceed = false.obs;
  bool isNavigateToChargingSummary = true;
  RxDouble usedEnergyCharge = 0.0.obs;

  factory ChargingDetailsScreenController() {
    return ChargingDetailsScreenController._();
  }

  @override
  void onInit() {
    chargeByType = Get.arguments[ArgumentsConfig.chargeByType] ?? ChargeBy.energy;
    _selectedTime = Get.arguments[ArgumentsConfig.selectedTime] ?? 0;
    _selectedEnergy = Get.arguments[ArgumentsConfig.selectedEnergy] ?? 0;
    _selectedAmount = Get.arguments[ArgumentsConfig.selectedAmount] ?? 0;
    chargerCode = Get.arguments[ArgumentsConfig.chargerId] ?? '';
    chargerName = Get.arguments[ArgumentsConfig.chargerName] ?? '';
    startTransactionTaskId = Get.arguments[ArgumentsConfig.taskId] ?? 0;
    transactionId = Get.arguments[ArgumentsConfig.transactionId] ?? 0;
    if (transactionId == 0) {
      getStartTransactionStatus();
    } else {
      onStartStatusSuccess();
    }
    super.onInit();
  }

  // API call for get start transaction status
  void getStartTransactionStatus() {
    _utility.api.getStartTransactionStatus(taskId: startTransactionTaskId).then((statusValue) {
      if (statusValue.status == 1 && statusValue.data != null) {
        if (statusValue.data!.transactionId! > 0) {
          transactionId = statusValue.data!.transactionId!;
          apiCallCounter = 0;
          onStartStatusSuccess();
          _utility.localStorage.saveTransactionId(statusValue.data!.transactionId!);
        } else if (statusValue.data!.transactionId! == 0) {
          // If transaction id is 0 then api call again after 4 second
          apiCallCounter = apiCallCounter + 1;
          Future.delayed(
            const Duration(seconds: 4),
            () {
              // After 1 min start transaction get status API call terminate
              if (apiCallCounter == 15) {
                apiCallCounter = 0;
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
          Get.back();
          CommonMethods.showSnackBarError(StringConfig.unexpectedError);
        }
      } else {
        Get.back();
      }
    }).catchError((error) {});
  }

  // Get meter value and start timer
  void onStartStatusSuccess() {
    isStartTransactionSucceed.value = true;
    getFirstTimeMeterValue();
    if (chargeByType == ChargeBy.time) {
      setupCountDownTimer();
    }
    getContinuesMeterValue();
  }

  // start count down timer if time selected for charging
  setupCountDownTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        // stop time and navigate to summary screen if transaction completed
        if (remainingSeconds < 0) {
          cancelTimer();
          getTransactionMeterValue();
          onStopTransaction();
        } else {
          // update remaining time ane percentage during ongoing transaction
          selectedTimeInSecond = (chargingDetail.totalTimeSeconds == 0)
              ? (selectedTime * 3600).toInt()
              : chargingDetail.totalTimeSeconds ?? 0;
          remainingTime.value = remainingSeconds;
          var duration = Duration(seconds: remainingTime.value.floor());
          minute.value = duration.inMinutes.remainder(60);
          second.value = duration.inSeconds.remainder(60);
          hour.value = duration.inHours;
          if (selectedTimeInSecond > 0) {
            _selectedPointer.value = (selectedTimeInSecond - remainingSeconds) * 100 / selectedTimeInSecond;
          }
          remainingSeconds--;
        }
      },
    );
  }

  // To handle timer and energy value from server
  void setTimerForChargingDurationFromServer() {
    int difference = 0;
    if (chargingDetail.remainingTimeInSeconds! > 0) {
      if (!isWatchReset) {
        difference = (remainingSeconds - chargingDetail.remainingTimeInSeconds!);
        if (difference > 0) {
          remainingSeconds = remainingSeconds - difference;
        }
        isWatchReset = true;
      }
    }
  }

  // For getting continues meter value
  void getContinuesMeterValue() {
    _chargingDurationTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) {
        if (isTransactionOn) {
          getTransactionMeterValue();
        }
      },
    );
  }

  // First time get meter value and show loader
  void getFirstTimeMeterValue() {
    remainingSeconds = (selectedTime * 3600).toInt();
    getTransactionMeterValue();
  }

  // Get Transaction detail API integration
  void getTransactionMeterValue() {
    try {
      _utility.api.getTransactionMeterValue(transactionId: transactionId).then((value) {
        if (value.status == 1) {
          chargingDetail = value.data!;
          isTransactionOn = !chargingDetail.isChargingStop!;
          if (!chargingDetail.isChargingStop!) {
            usedEnergy.value = chargingDetail.energyUsed!;
            usedEnergyCharge.value = chargingDetail.energyUsageCharge!;
            usedEnergyUnit = chargingDetail.unit!;
            if (chargeByType == ChargeBy.time) {
              // Case: Charge by Time
              // Set remaining timer from api
              setTimerForChargingDurationFromServer();
            } else if (chargeByType == ChargeBy.energy) {
              // Case: Charge by Energy
              // set selected energy
              _selectedEnergy =
                  (chargingDetail.selectedEnergy == 0.0) ? _selectedEnergy : chargingDetail.selectedEnergy ?? 10.0;
              remainingEnergy.value = selectedEnergy - usedEnergy.value;
              _selectedPointer.value = (usedEnergy * 100) / selectedEnergy;
              // For stop transaction on 100% charging while selected energy case
              if (selectedEnergy == usedEnergy.value || selectedEnergy < usedEnergy.value) {
                onStopTransaction();
              }
            } else {
              // Case: Charge by Amount
              // set selected amount
              _selectedAmount =
                  (chargingDetail.totalAmountForCharge == 0.0) ? _selectedAmount : chargingDetail.totalAmountForCharge!;
              remainingAmount.value = selectedAmount - usedEnergyCharge.value;
              _selectedPointer.value = (usedEnergyCharge * 100) / selectedAmount;
              // For stop transaction on 100% charging while selected energy case
              if (selectedAmount == usedEnergyCharge.value || selectedAmount < usedEnergyCharge.value) {
                onStopTransaction();
              }
            }
          } else {
            clearDataAndNavigateToSummary();
          }
        } else {
          if (value.status == ApiConfig.alreadyStoppedChargingErrorCode) {
            clearDataAndNavigateToSummary();
          } else {
            onBackPress();
            CommonMethods.showSnackBarError(value.message!);
          }
        }
      }).catchError((error) {
        printLog('Error in get transaction meter value API call - $error');
      });
    } catch (error) {
      printLog('Error in get transaction meter value - $error');
    }
  }

  // Stop Transaction API integration
  void onStopTransaction() {
    _isLoading.value = true;
    _utility.api.stopTransaction(chargerCode: chargerCode, transactionId: transactionId).then((value) {
      if (value.status == 1 && value.data != null) {
        _isTransactionStop.value = true;
        taskId = value.data!.taskId!;
        Future.delayed(
          const Duration(seconds: 4),
          () {
            apiCallCounter = 1;
            // API call for get stop transaction status if stop transaction is successful
            getStopTransactionStatus();
          },
        );
      } else {
        _isLoading.value = false;
        if (value.status == ApiConfig.alreadyStoppedChargingErrorCode) {
          clearDataAndNavigateToSummary();
        } else {
          onBackPress();
          CommonMethods.showSnackBarError(value.message!);
        }
      }
    }).catchError((error) {
      _isLoading.value = false;
      printLog('Error in stop transaction API call - $error');
    });
  }

// if charging gets stop in any case then clears data and navigates to summary screen
  clearDataAndNavigateToSummary() {
    cancelTimer();
    _utility.localStorage.setTransactionOnStatus(false);
    if (isNavigateToChargingSummary) {
      isNavigateToChargingSummary = false;
      // To check if charging details screen is still in the stack or not, if Details screen will be in the stack then
      // call Get.off else call Get.to
      if (Get.isRegistered<ChargingDetailsScreenController>()) {
        Get.off(() => const ChargingSummaryScreen(), arguments: {
          ArgumentsConfig.chargerName: chargerName,
          ArgumentsConfig.transactionId: transactionId,
        });
      } else {
        Get.to(() => const ChargingSummaryScreen(), arguments: {
          ArgumentsConfig.chargerName: chargerName,
          ArgumentsConfig.transactionId: transactionId,
        });
      }
    }
  }

// Get stop transaction status
  void getStopTransactionStatus() {
    _isLoading.value = true;
    _utility.api.getStopTransactionStatus(taskId: taskId).then((statusValue) {
      if (statusValue.status == 1 && statusValue.data != null) {
        // If status is success then go to next screen
        if (statusValue.data!.taskStatus == StringConfig.successStatus) {
          clearDataAndNavigateToSummary();
          _isLoading.value = false;
          apiCallCounter = 0;
          // If status is waiting then api call again after 4 second
        } else if (statusValue.data!.taskStatus == StringConfig.waitingStatus) {
          apiCallCounter = apiCallCounter + 1;
          Future.delayed(
            const Duration(seconds: 4),
            () {
              // After 1 min start transaction get status API call terminate
              if (apiCallCounter == 15) {
                apiCallCounter = 0;
                _isLoading.value = false;
                CommonMethods.showSnackBarError(StringConfig.unexpectedError);
                _isTransactionStop.value = false;
                return;
              }
              // API call for get start transaction status if start transaction is successful
              getStopTransactionStatus();
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
        _isTransactionStop.value = false;
      }
    }).catchError((error) {
      printLog('Error in get stop transaction status API call - $error');
    });
  }

// On go back
  void onBackPress() {
    cancelTimer();
    _utility.localStorage.saveIndexKey(0);
    Get.back();
    MapController mapController = BaseInstance.get();
    Future.delayed(const Duration(milliseconds: 500), () {
      mapController.onRefreshClick();
    });
  }

// On back from mobile back button
  onWillPop() {
    onBackPress();
  }

  @override
  void dispose() {
    cancelTimer();
    super.dispose();
  }

  void cancelTimer() {
    apiCallCounter = 15;
    if (_chargingDurationTimer != null) {
      _chargingDurationTimer?.cancel();
      _chargingDurationTimer = null;
      print('duration timer cancel');
    }
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
      print('timer cancel');
    }
  }

  @override
  BaseFlavorConfig get flavor => _utility.flavor.currentFlavor;

  @override
  StyleController get styles => _utility.style;
}
