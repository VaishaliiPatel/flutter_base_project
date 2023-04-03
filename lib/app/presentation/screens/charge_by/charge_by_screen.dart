import 'dart:math' as math;

import 'package:cmsocpp/app/data/models/validate_charger/validate_charger.dart';
import 'package:cmsocpp/app/presentation/screens/charge_by/charge_by_screen_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/common_appbar.dart';
import 'package:cmsocpp/app/presentation/widgets/common_button.dart';
import 'package:cmsocpp/app/presentation/widgets/common_text_field.dart';
import 'package:cmsocpp/app/presentation/widgets/progress_loader.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:cmsocpp/utils/enums.dart';
import 'package:cmsocpp/utils/print_log.dart';
import 'package:cmsocpp/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ChargeByScreen extends BaseStatelessWidget {
  const ChargeByScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChargeByScreenController controller = Get.put(ChargeByScreenController());
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Stack(
        children: [
          Scaffold(
              backgroundColor: controller.flavor.appColors!.appBgColor,
              resizeToAvoidBottomInset: (Get.size.height > AppConfig.minDeviceHeight) ? false : true,

              /// App Bar
              appBar: CommonAppBar(
                flavor: controller.flavor,
                styles: controller.styles,
                title: StringConfig.chargeBy,
                showBackIcon: true,
                onClick: controller.onBackPress,
              ),
              body: (Get.size.height > AppConfig.minDeviceHeight)
                  ? _buildBodyView(controller)
                  : SingleChildScrollView(
                      child: _buildBodyView(controller),
                    )),

          /// Progress Loader
          Obx(
            () => controller.isLoading.value ? ProgressLoader() : const SizedBox(),
          ),
        ],
      ),
    );
  }

  // App body view
  Widget _buildBodyView(ChargeByScreenController controller) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 8.h),

          /// Select connector text
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Text(
                StringConfig.selectConnector,
                style: controller.styles.mediumTextLight,
              ),
            ),
          ),

          /// Connector Dropdown
          DropdownButtonFormField<ConnectorId>(
            icon: Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: Transform.rotate(
                  angle: 45 * math.pi / 90,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: controller.flavor.appColors!.textFieldHintColor,
                  )),
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: controller.flavor.appColors!.dropdownBorderColor!,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: controller.flavor.appColors!.dropdownBorderColor!,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            hint: const Text(
              StringConfig.selectConnector,
            ),
            onChanged: (newValue) {
              controller.setSelectedConnector(newValue!);
            },
            dropdownColor: controller.flavor.appColors!.appBgColor!,
            borderRadius: BorderRadius.circular(12.r),
            isExpanded: true,
            value: controller.selectedConnector,
            selectedItemBuilder: (context) {
              return controller.connectors.map<Widget>((ConnectorId item) {
                return Text(
                  item.connectorType.toString(),
                  style: controller.styles.infoTextStyle,
                );
              }).toList();
            },
            items: controller.connectors.map((ConnectorId value) {
              return DropdownMenuItem<ConnectorId>(
                value: value,
                enabled: (value.connectorStatus == ConnectorStatus.available.value) ? true : false,
                child: Container(
                  decoration: BoxDecoration(
                      color: controller.flavor.appColors!.dropDownItemBgColor,
                      borderRadius: BorderRadius.circular(10.r)),
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                  margin: EdgeInsets.symmetric(vertical: 4.h),
                  child: Row(
                    children: [
                      /// Charger TYPE
                      Text(
                        value.connectorType.toString(),
                        textAlign: TextAlign.start,
                        style: controller.styles.infoTextStyle,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),

                      /// Socket Image
                      Image.network(
                        value.connectorImage!,
                        height: 24.h,
                        width: 24.w,
                      ),
                      const Spacer(),

                      /// Connector Status
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            14.r,
                          ),
                          border: Border.all(
                            width: 1.r,
                            color: CommonMethods.getColorByConnectorStatus(
                                CommonMethods.getStatusFromApi(value.connectorStatus), controller.flavor)!,
                          ),
                        ),
                        child: Text(
                          (value.connectorStatus == ConnectorStatus.inUse.value)
                              ? (StringConfig.inUse)
                              : value.connectorStatus ?? "",
                          style: controller.styles.mediumTextGreen.copyWith(
                              color: CommonMethods.getColorByConnectorStatus(
                                  CommonMethods.getStatusFromApi(value.connectorStatus), controller.flavor)!),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),

          SizedBox(
            height: 24.h,
          ),

          /// For show charge per unit
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 5.r),
            decoration: BoxDecoration(
              color: controller.flavor.appColors!.tabBgColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: double.parse(controller.chargePerUnit) == 0
                ? Text.rich(
                    /// Register text
                    TextSpan(
                      text: '${StringConfig.unitChargeText} : ',
                      style: controller.styles.smallBlackTextStyle,
                      children: <InlineSpan>[
                        /// Register Navigation button
                        TextSpan(
                          text: StringConfig.free,
                          style: controller.styles.smallBlackTextStyle
                              ?.copyWith(color: controller.flavor.appColors!.primaryColor),
                        )
                      ],
                    ),
                  )
                : Text(
                    '${StringConfig.unitChargeText} : ${controller.chargePerUnit}${StringConfig.rupees}/${StringConfig.chargingUnit}',
                    style: controller.styles.smallBlackTextStyle,
                  ),
          ),
          SizedBox(
            height: 16.h,
          ),

          /// description text
          Text(StringConfig.chargeByDescription, textAlign: TextAlign.center, style: controller.styles.subTitleStyle),

          /// Tabs view
          Container(
            height: 52.h,
            margin: EdgeInsets.only(top: 24.h),
            decoration: BoxDecoration(
              color: controller.flavor.appColors!.tabBgColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: TabBar(
              controller: controller.tabController,
              onTap: (index) {
                CommonMethods.hideKeyBoard();
              },
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: controller.flavor.appColors!.selectedTabColor,
              ),
              labelColor: controller.flavor.appColors!.titleColor,
              padding: EdgeInsets.all(4.r),
              labelStyle: controller.styles.tabTextStyle,
              tabs: const [
                Tab(
                  text: StringConfig.energy,
                ),
                Tab(
                  text: StringConfig.time,
                ),
                Tab(
                  text: StringConfig.amount,
                ),
              ],
            ),
          ),

          /// Tab bar view
          (Get.size.height > AppConfig.minDeviceHeight)
              ? Flexible(
                  child: _buildTabBarView(controller),
                )
              : ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 250, maxHeight: 300),
                  child: _buildTabBarView(controller),
                ),

          /// Start Button
          AppButton(
            flavor: controller.flavor,
            styles: controller.styles,
            title: StringConfig.start,
            horizontalPadding: Get.width / 5,
            onTap: controller.onStartTransaction,
          ),
          SizedBox(
            height: 12.h,
          )
        ],
      ),
    );
  }

  // Charge by types tab bar views
  Widget _buildTabBarView(ChargeByScreenController controller) {
    return TabBarView(controller: controller.tabController, physics: const NeverScrollableScrollPhysics(), children: [
      /// Energy Selection View
      Padding(
        padding: EdgeInsets.symmetric(vertical: 24.r, horizontal: 12.r),
        child: Obx(() {
          return SfRadialGauge(
            axes: [
              /// Progress Axis
              RadialAxis(
                minimum: 0,
                maximum: 1,
                radiusFactor: 0.8,
                labelFormat: '{value} Kw',
                showFirstLabel: true,
                showLastLabel: true,
                showTicks: false,
                interval: 100,
                startAngle: 125,
                endAngle: 55,
                labelOffset: -35,
                axisLineStyle: AxisLineStyle(
                  color: controller.flavor.appColors!.partialProgressColor,
                ),
                axisLabelStyle: GaugeTextStyle(
                  fontSize: 16.sp,
                  color: controller.flavor.appColors!.subTitleColor,
                ),
                ranges: <GaugeRange>[
                  /// progress range painter
                  GaugeRange(
                    endValue: controller.selectedEnergy,
                    sizeUnit: GaugeSizeUnit.factor,
                    startValue: 0,
                    color: controller.flavor.appColors!.primaryColor,
                    startWidth: 0.08,
                    endWidth: 0.08,
                  ),
                ],
                pointers: <GaugePointer>[
                  /// slider thumb
                  MarkerPointer(
                    value: controller.selectedEnergy,
                    color: controller.flavor.appColors!.primaryColor,
                    enableDragging: true,
                    borderColor: Colors.white,
                    markerHeight: 25.r,
                    borderWidth: 3.r,
                    markerWidth: 25.r,
                    markerType: MarkerType.circle,
                    onValueChanging: (val) {
                      controller.handleEnergyPointerValueChanging(val, controller);
                    },
                  ),
                ],
                annotations: <GaugeAnnotation>[
                  /// selected time value
                  GaugeAnnotation(
                    widget: Text(
                      '${controller.selectedEnergy.toPrecision(2)} Kw / '
                      '${controller.payableAmount.toPrecision(2)} ${StringConfig.rupees}',
                      textAlign: TextAlign.center,
                      style: controller.styles.mediumTextDark,
                    ),
                  ),
                ],
              ),

              /// Dashed Axis
              RadialAxis(
                minimum: 0,
                maximum: 20,
                showTicks: true,
                axisLineStyle: const AxisLineStyle(thickness: 0),
                majorTickStyle: MajorTickStyle(
                  length: 2,
                  thickness: 4,
                  color: controller.flavor.appColors!.dashedLineColor,
                ),
                interval: 1,
                minorTickStyle: MinorTickStyle(
                  length: 2,
                  thickness: 4,
                  color: controller.flavor.appColors!.dashedLineColor,
                ),
                showLabels: false,
                startAngle: 135,
                endAngle: 45,
              )
            ],
          );
        }),
      ),

      /// Time Selection View
      Padding(
        padding: EdgeInsets.symmetric(vertical: 24.r, horizontal: 12.r),
        child: Obx(() {
          printLog('Selected time-----${controller.selectedTime}');

          return SfRadialGauge(
            axes: [
              /// Progress Axis
              RadialAxis(
                minimum: 0,
                maximum: 10,
                labelFormat: '{value} Hr',
                radiusFactor: 0.8,
                showTicks: true,
                showLabels: true,
                labelsPosition: ElementsPosition.inside,
                minorTickStyle: MinorTickStyle(length: 4, color: controller.flavor.appColors!.dashedLineColor),
                majorTickStyle: MajorTickStyle(length: 6, color: controller.flavor.appColors!.dashedLineColor),
                minorTicksPerInterval: 1,
                startAngle: 125,
                endAngle: 55,
                showLastLabel: true,
                axisLineStyle: AxisLineStyle(color: (controller.flavor.appColors!.partialProgressColor)),
                axisLabelStyle: GaugeTextStyle(color: controller.flavor.appColors!.subTitleColor),
                ranges: <GaugeRange>[
                  /// progress range painter
                  GaugeRange(
                    endValue: controller.selectedTime,
                    sizeUnit: GaugeSizeUnit.factor,
                    startValue: 0,
                    color: ColorConfig.primaryColor,
                    startWidth: 0.08,
                    endWidth: 0.08,
                  ),
                ],
                pointers: <GaugePointer>[
                  /// slider thumb
                  MarkerPointer(
                    value: controller.selectedTime,
                    color: ColorConfig.primaryColor,
                    enableDragging: true,
                    borderColor: Colors.white,
                    markerHeight: 25.r,
                    borderWidth: 3.r,
                    markerWidth: 25.r,
                    markerType: MarkerType.circle,
                    onValueChanging: (val) {
                      controller.handleTimePointerValueChanging(val, controller);
                    },
                  ),
                ],
                annotations: <GaugeAnnotation>[
                  /// selected time value
                  GaugeAnnotation(
                    widget: Text(
                      '${controller.parsedTime} Hr',
                      style: controller.styles.mediumTextDark,
                    ),
                  ),
                ],
              ),

              /// Dashed Axis
              RadialAxis(
                minimum: 0,
                maximum: 20,
                showTicks: true,
                axisLineStyle: const AxisLineStyle(thickness: 0),
                ticksPosition: ElementsPosition.outside,
                interval: 1,
                minorTicksPerInterval: 1,
                showLabels: false,
                startAngle: 125,
                endAngle: 55,
                minorTickStyle: MinorTickStyle(
                  length: 2,
                  thickness: 4,
                  color: controller.flavor.appColors!.dashedLineColor,
                ),
                majorTickStyle: MajorTickStyle(
                  length: 2,
                  thickness: 4,
                  color: controller.flavor.appColors!.dashedLineColor,
                ),
              )
            ],
          );
        }),
      ),

      /// Amount Selection View
      Container(
        margin: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
        child: Column(
          children: [
            /// Amount Field
            AppTextField(
              title: StringConfig.amountText,
              isCompulsoryField: false,
              controller: controller.amountController,
              styles: controller.styles,
              flavor: controller.flavor,
              hintText: StringConfig.enterAmountText,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textInputType: TextInputType.number,
              onChanged: (value) {
                controller.handleAmountValue(value);
              },
              validator: (value) {
                return Validation.validateEmptyField(value: value!, errorMsg: StringConfig.paymentWarningText);
              },
              isSpacingFromBottom: false,
            ),
            SizedBox(
              height: 24.h,
            ),

            SizedBox(
              height: 40.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.amountController.text = controller.amountOptions[index];
                      controller.handleAmountValue(controller.amountController.text);
                      controller.amountController.selection =
                          TextSelection.collapsed(offset: controller.amountController.text.length);
                    },
                    child: Card(
                      color: controller.flavor.appColors!.appBgColor,
                      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                      elevation: 2.0,
                      surfaceTintColor: controller.flavor.appColors!.whiteColor,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
                          child: Text(
                            controller.amountOptions[index],
                            style: controller.styles.smallBlackTextStyle,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                itemCount: controller.amountOptions.length,
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
