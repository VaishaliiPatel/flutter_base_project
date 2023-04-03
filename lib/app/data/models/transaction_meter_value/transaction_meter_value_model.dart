import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_meter_value_model.freezed.dart';

part 'transaction_meter_value_model.g.dart';

TransactionMeterValueModel transactionMeterValueModelFromJson(String str) =>
    TransactionMeterValueModel.fromJson(json.decode(str));

String transactionMeterValueModelStatusModelToJson(TransactionMeterValueModel data) => json.encode(data.toJson());

@Freezed(unionValueCase: FreezedUnionCase.snake)
class TransactionMeterValueModel with _$TransactionMeterValueModel {
  const factory TransactionMeterValueModel({
    int? status,
    String? message,
    Data? data,
    ValidationError? validationError,
  }) = _TransactionMeterValueModel;

  factory TransactionMeterValueModel.fromJson(Map<String, dynamic> json) => _$TransactionMeterValueModelFromJson(json);
}

@Freezed(unionValueCase: FreezedUnionCase.snake)
class Data with _$Data {
  const factory Data({
    double? energyUsed,
    String? unit,
    bool? isChargingStop,
    String? remainingTime,
    int? remainingTimeInSeconds,
    int? selectedOperationType,
    double? selectedEnergy,
    String? totalTime,
    int? totalTimeSeconds,
    double? energyUsageCharge,
    double? totalAmountForCharge,
    double? remainAmountForCharge,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@Freezed(unionValueCase: FreezedUnionCase.snake)
class ValidationError with _$ValidationError {
  const factory ValidationError() = _ValidationError;

  factory ValidationError.fromJson(Map<String, dynamic> json) => _$ValidationErrorFromJson(json);
}
