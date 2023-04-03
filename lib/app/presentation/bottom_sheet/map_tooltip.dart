import 'dart:math' as math;

import 'package:cmsocpp/app/data/models/charge_point_location/charge_point_location.dart';
import 'package:cmsocpp/app/presentation/screens/map/map_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/connector_type_list.dart';
import 'package:cmsocpp/app/presentation/widgets/icon_with_circle_bg.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:cmsocpp/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MapToolTipBottomSheet extends BaseStatelessWidget {
  final Datum charger;

  const MapToolTipBottomSheet({required this.charger, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: IntrinsicHeight(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///  Header row
            Row(
              children: [
                /// Header widget
                Text(
                  charger.locationName ?? '',
                  style: controller.styles.titleStyle?.copyWith(fontSize: 20),
                ),
                SizedBox(
                  width: 5.w,
                ),

                /// Map redirection Icon
                InkWell(
                  onTap: () => controller.openMap(charger),
                  child: Transform.rotate(
                    angle: 45 * math.pi / 180,
                    child: Icon(
                      Icons.assistant_navigation,
                      color: controller.flavor.appColors!.primaryColor,
                      size: 24.r,
                    ),
                  ),
                ),
                const Spacer(),

                /// Close  Icon
                IconWithCircleBg(
                  flavor: controller.flavor,
                  onClick: controller.onBack,
                ),

                ///  Gallery button
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () => controller.onChargePointItemClick(charger),
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 10.h,
                ),
                padding: EdgeInsets.only(top: 15.r, bottom: 10.r, left: 12.r, right: 12.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: controller.flavor.appColors!.lightGreyForDetailBg!.withOpacity(0.3),
                  border: Border.all(
                    width: 1.r,
                    color: controller.flavor.appColors!.lightGreyForDetailBg!,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Location marker
                        Image.asset(
                          CommonMethods.getIconByConnectorStatus(
                              CommonMethods.getStatusFromApi(charger.status), controller.flavor)!,
                          width: 15.w,
                          height: 25.h,
                        ),
                        SizedBox(width: 12.w),

                        /// Charger location name
                        Expanded(
                          child: Text(
                            charger.locationAddress ?? '',
                            style: controller.styles.mediumTextBlack,
                          ),
                        ),
                      ],
                    ),
                    if (!(charger.acConnectors!.isEmpty && charger.dcConnectors!.isEmpty))
                      SizedBox(
                        height: 5.h,
                      ),
                    if (!(charger.acConnectors!.isEmpty && charger.dcConnectors!.isEmpty))
                      Divider(
                        color: controller.flavor.appColors!.lightGreyForDetailBg!,
                        thickness: 1.5.r,
                      ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// AC connector type list
                        if (charger.acConnectors!.isNotEmpty)
                          ConnectorTypeList(
                            styles: controller.styles,
                            flavor: controller.flavor,
                            title: StringConfig.acConnector,
                            connectorList: charger.acConnectors!,
                          ),
                        SizedBox(
                          width: 5.w,
                        ),
                        if (charger.acConnectors!.isNotEmpty && charger.dcConnectors!.isNotEmpty)
                          buildVerticalDivider(controller),
                        SizedBox(
                          width: 5.w,
                        ),

                        /// DC connector type List
                        if (charger.dcConnectors!.isNotEmpty)
                          ConnectorTypeList(
                            styles: controller.styles,
                            flavor: controller.flavor,
                            title: StringConfig.dcConnector,
                            connectorList: charger.dcConnectors!,
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Divider(
                      color: controller.flavor.appColors!.lightGreyForDetailBg!,
                      thickness: 1.5.r,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          /// Charge per unit
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                (double.parse(charger.tariffPlanCharge!) > 0.0)
                                    ? '${charger.tariffPlanCharge} ${StringConfig.rupees}/${StringConfig.chargingUnit}'
                                    : StringConfig.free,
                                style: controller.styles.mediumTextBlack.copyWith(
                                    color: (double.parse(charger.tariffPlanCharge!) > 0.0)
                                        ? controller.flavor.appColors!.titleColor
                                        : controller.flavor.appColors!.primaryColor),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                StringConfig.chargeText,
                                style: controller.styles.verySmallLightTextStyle,
                              ),
                            ],
                          ),
                        ),
                        buildVerticalDivider(controller),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SelectableText(
                                onTap: () => controller.onChargePointItemClick(charger),
                                charger.chargeBoxId!,
                                textAlign: TextAlign.center,
                                style: controller.styles.mediumTextBlack,
                              ),
                              Text(
                                StringConfig.chargerId,
                                style: controller.styles.verySmallLightTextStyle,
                              ),
                            ],
                          ),
                        ),
                        buildVerticalDivider(controller),
                        SizedBox(width: 2.r),
                        Expanded(
                          /// Charger location
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                (charger.status == ConnectorStatus.inUse.value)
                                    ? (StringConfig.inUse)
                                    : charger.status ?? "",
                                textAlign: TextAlign.center,
                                style: controller.styles.mediumTextGreen.copyWith(
                                  color: CommonMethods.getColorByConnectorStatus(
                                      CommonMethods.getStatusFromApi(charger.status), controller.flavor)!,
                                ),
                              ),
                              Text(
                                StringConfig.statusText,
                                style: controller.styles.verySmallLightTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildVerticalDivider(MapController controller) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
      height: 40.h,
      width: 1.5.r,
      color: controller.flavor.appColors!.lightGreyForDetailBg!,
    );
  }
}
