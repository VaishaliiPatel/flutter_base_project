import 'package:cmsocpp/app/data/models/charge_point_location/charge_point_location.dart';
import 'package:cmsocpp/app/presentation/screens/map/map_controller.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:cmsocpp/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'connector_type_list.dart';

class ChargerItemView extends StatelessWidget {
  const ChargerItemView({
    required this.chargerItem,
    required this.flavor,
    required this.styles,
    required this.onClick,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final BaseFlavorConfig flavor;
  final StyleController styles;
  final Datum chargerItem;
  final VoidCallback onClick;
  final MapController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 14.h,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Location marker
                Image.asset(
                  CommonMethods.getIconByConnectorStatus(
                      CommonMethods.getStatusFromApi(chargerItem.status), controller.flavor)!,
                  width: 15.w,
                  height: 25.h,
                ),
                SizedBox(width: 12.w),

                /// Charger location name
                Expanded(
                  child: Text(
                    chargerItem.locationName ?? '',
                    style: styles.infoTextStyle,
                  ),
                ),

                /// Charging ongoing field
                if (chargerItem.isChargingRunning ?? false)
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        16.r,
                      ),
                      color: flavor.appColors!.primaryColor?.withOpacity(0.1),
                      border: Border.all(
                        width: 1.r,
                        color: flavor.appColors!.primaryColor!,
                      ),
                    ),
                    child: Text(
                      StringConfig.ongoing,
                      style: styles.mediumTextGreen,
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            if (!(chargerItem.acConnectors!.isEmpty && chargerItem.dcConnectors!.isEmpty))
              Divider(
                color: controller.flavor.appColors!.lightGreyForDetailBg!,
                thickness: 1.5.r,
              ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// AC connector type list
                if (chargerItem.acConnectors!.isNotEmpty)
                  ConnectorTypeList(
                    styles: styles,
                    flavor: flavor,
                    title: StringConfig.acConnector,
                    connectorList: chargerItem.acConnectors!,
                  ),
                SizedBox(
                  width: 5.h,
                ),
                if (chargerItem.acConnectors!.isNotEmpty && chargerItem.dcConnectors!.isNotEmpty)
                  buildVerticalDivider(controller),
                SizedBox(
                  width: 5.h,
                ),

                /// DC connector type List
                if (chargerItem.dcConnectors!.isNotEmpty)
                  ConnectorTypeList(
                    styles: styles,
                    flavor: flavor,
                    title: StringConfig.dcConnector,
                    connectorList: chargerItem.dcConnectors!,
                  ),
              ],
            ),
            if (!(chargerItem.acConnectors!.isEmpty && chargerItem.dcConnectors!.isEmpty))
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
                    children: [
                      Text(
                        (double.parse(chargerItem.tariffPlanCharge!) > 0.0)
                            ? '${chargerItem.tariffPlanCharge} ${StringConfig.rupees}/${StringConfig.chargingUnit}'
                            : StringConfig.free,
                        style: controller.styles.mediumTextBlack.copyWith(
                            color: (double.parse(chargerItem.tariffPlanCharge!) > 0.0)
                                ? controller.flavor.appColors!.titleColor
                                : controller.flavor.appColors!.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        StringConfig.chargeText,
                        style: styles.verySmallLightTextStyle,
                      ),
                    ],
                  ),
                ),
                buildVerticalDivider(controller),
                Expanded(
                  /// Charger location
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        chargerItem.zoneName ?? '',
                        style: styles.mediumTextBlack,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        StringConfig.locationText,
                        style: styles.verySmallLightTextStyle,
                      ),
                    ],
                  ),
                ),
                buildVerticalDivider(controller),
                SizedBox(width: 2.r),
                Expanded(
                  /// Charger Status
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (chargerItem.status == ConnectorStatus.inUse.value)
                            ? (StringConfig.inUse)
                            : chargerItem.status ?? "",
                        textAlign: TextAlign.center,
                        style: controller.styles.mediumTextGreen.copyWith(
                          color: CommonMethods.getColorByConnectorStatus(
                              CommonMethods.getStatusFromApi(chargerItem.status), controller.flavor)!,
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
    );
  }

  Widget buildVerticalDivider(MapController controller) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
      height: 40.h,
      width: 2.w,
      decoration: BoxDecoration(
        color: controller.flavor.appColors!.primaryColor?.withOpacity(0.1),
        border: Border.all(
          width: 1.r,
          color: controller.flavor.appColors!.lightGreyForDetailBg!,
        ),
      ),
    );
  }
}
