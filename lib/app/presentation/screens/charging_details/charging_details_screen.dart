import 'package:cmsocpp/app/presentation/screens/charging_details/charging_details_screen_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/common_appbar.dart';
import 'package:cmsocpp/app/presentation/widgets/common_button.dart';
import 'package:cmsocpp/app/presentation/widgets/progress_loader.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:cmsocpp/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ChargingDetailsScreen extends BaseStatelessWidget {
  const ChargingDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChargingDetailsScreenController controller = Get.put(ChargingDetailsScreenController());
    return WillPopScope(
      onWillPop: () {
        controller.onWillPop();
        return Future.value(true);
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: CommonAppBar(
              flavor: controller.flavor,
              styles: controller.styles,
              title: '',
              showBackIcon: true,
              onClick: controller.onBackPress,
            ),
            backgroundColor: controller.flavor.appColors!.appBgColor,
            body: Padding(
              padding: EdgeInsets.only(
                left: 12.r,
                right: 12.r,
                bottom: 24.r,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Obx(
                    () {
                      return controller.isStartTransactionSucceed.value
                          ? const SizedBox()
                          : Container(
                              margin: EdgeInsets.only(bottom: 20.h),
                              child: Text(
                                StringConfig.updatingText,
                                style: controller.styles.mediumTextDark,
                              ),
                            );
                    },
                  ),

                  /// Timer View
                  if (controller.chargeByType == ChargeBy.time) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() {
                          return _timeBoxView(controller, controller.hour.toString().padLeft(2, "0"));
                        }),
                        Obx(() {
                          return _timeBoxView(controller, controller.minute.toString().padLeft(2, "0"));
                        }),
                        Obx(() {
                          return _timeBoxView(controller, controller.second.value.toString().padLeft(2, "0"),
                              isLast: true);
                        }),
                      ],
                    ),
                    SizedBox(height: 24.r),
                  ],

                  /// Circular progress View
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.r, right: 24.r, bottom: 24.r),
                      child: Obx(() {
                        return SfRadialGauge(
                          axes: [
                            /// Progress Axis
                            RadialAxis(
                              minimum: 0,
                              maximum: 100,
                              showLabels: false,
                              startAngle: 90,
                              offsetUnit: GaugeSizeUnit.logicalPixel,
                              endAngle: 90,
                              axisLineStyle: AxisLineStyle(color: controller.flavor.appColors!.partialProgressColor),
                              pointers: <GaugePointer>[
                                RangePointer(
                                  value: controller.selectedPointer,
                                  enableDragging: false,
                                  enableAnimation: true,
                                  color: controller.flavor.appColors!.primaryColor,
                                )
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                  widget: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        AssetsConfig.flashIcon,
                                      ),
                                      Flexible(
                                        child: Obx(() {
                                          return Text(
                                            ' ${controller.selectedPointer.toStringAsFixed(0)}%',
                                            style: controller.styles.largeText,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                              ],

                              /// This properties are set to show dashed line in outer area
                              showTicks: true,
                              ticksPosition: ElementsPosition.outside,
                              majorTickStyle: MajorTickStyle(
                                length: 2,
                                thickness: 4,
                                color: controller.flavor.appColors!.dashedLineColor,
                              ),
                              interval: 4,
                              tickOffset: 14,
                              minorTickStyle: MinorTickStyle(
                                length: 2,
                                thickness: 4,
                                color: controller.flavor.appColors!.dashedLineColor,
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),

                  /// Show charger id
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 5.r),
                    decoration: BoxDecoration(
                      color: controller.flavor.appColors!.tabBgColor,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Text(
                      '${StringConfig.chargerId} ${controller.chargerCode}',
                      style: controller.styles.mediumTextDark,
                    ),
                  ),

                  /// SHow charger text
                  Text(
                    StringConfig.evCharger,
                    style: controller.styles.termsAndConditionTextStyle,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Energy charge view
                      Expanded(
                        flex: 1,
                        child: Obx(() {
                          return _energyDetailView(
                            controller,
                            icon: AssetsConfig.currencyIcon,
                            value: '${controller.usedEnergyCharge.value.toStringAsFixed(3)} ${StringConfig.rupees}',
                            subTitle: StringConfig.chargingAmountText,
                          );
                        }),
                      ),

                      /// Energy Detail view
                      Expanded(
                        flex: 1,
                        child: Obx(() {
                          return _energyDetailView(
                            controller,
                            icon: AssetsConfig.energyIcon,
                            value: '${controller.usedEnergy.value.toStringAsFixed(3)} ${controller.usedEnergyUnit}',
                            subTitle: StringConfig.energyUsed,
                          );
                        }),
                      ),

                      /// Show remaining energy view
                      controller.chargeByType == ChargeBy.time
                          ? const SizedBox.shrink()
                          : Obx(
                              () {
                                return Expanded(
                                  flex: 1,
                                  child: _energyDetailView(
                                    controller,
                                    icon: AssetsConfig.timeIcon,
                                    value: controller.chargeByType == ChargeBy.energy
                                        ? '${controller.remainingEnergy.value.toStringAsFixed(3)} ${controller.usedEnergyUnit}'
                                        : '${controller.remainingAmount.value.toStringAsFixed(3)} ${StringConfig.rupees}',
                                    subTitle: controller.chargeByType == ChargeBy.energy
                                        ? StringConfig.remainingEnergy
                                        : StringConfig.remainingAmount,
                                  ),
                                );
                              },
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),

                  /// Stop Button
                  Obx(() {
                    return AppButton(
                      flavor: controller.flavor,
                      styles: controller.styles,
                      title: StringConfig.stop,
                      horizontalPadding: Get.width / 5,
                      buttonColor: controller.isTransactionStop.value || !controller.isStartTransactionSucceed.value
                          ? controller.flavor.appColors!.disableButtonColor
                          : controller.flavor.appColors!.enableButtonColor,
                      onTap: controller.isTransactionStop.value || !controller.isStartTransactionSucceed.value
                          ? null
                          : controller.onStopTransaction,
                    );
                  }),
                ],
              ),
            ),
          ),

          /// Progress Loader
          Obx(
            () => controller.isLoading.value ? ProgressLoader() : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _timeBoxView(ChargingDetailsScreenController controller, String time, {bool isLast = false}) {
    return Row(
      children: [
        /// timer single box
        Container(
          width: 48.r,
          height: 48.r,
          alignment: Alignment.center,
          padding: EdgeInsets.all(4.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: ColorConfig.enabledBorderColor, width: 1.r),
          ),
          child: Text(
            time,
            style: controller.styles.timerTextStyle,
          ),
        ),
        if (!isLast)
          Text(
            ' : ',
            style: controller.styles.verySmallLightTextStyle.copyWith(
              fontSize: 18,
              color: ColorConfig.enabledBorderColor,
            ),
          ),
      ],
    );
  }

  Widget _energyDetailView(var controller, {required String icon, required String value, required String subTitle}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,

        /// Icon
        children: [
          SvgPicture.asset(
            icon,
            height: 30.r,
            width: 30.r,
          ),
          SizedBox(
            height: 24.r,
          ),

          /// title
          Text(
            value,
            textAlign: TextAlign.center,
            style: controller.styles.smallBoldTextStyle,
          ),

          /// Sub title
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: controller.styles.verySmallLightTextStyle,
          )
        ],
      ),
    );
  }
}
