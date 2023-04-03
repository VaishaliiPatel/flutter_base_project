import 'package:cmsocpp/app/presentation/screens/charger_summary/charging_summary_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/common_appbar.dart';
import 'package:cmsocpp/app/presentation/widgets/common_button.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChargingSummaryScreen extends BaseStatelessWidget {
  const ChargingSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChargingSummaryController());

    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: controller.flavor.appColors!.appBgColor,

          /// App Bar
          appBar: CommonAppBar(
            flavor: controller.flavor,
            styles: controller.styles,
            title: StringConfig.chargingSummary,
            onClick: controller.onBackPress,
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 20.r, right: 20.r, bottom: 24.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10.h,
                ),

                /// Summary tag line field
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.r),
                    color:controller.flavor.appColors!.extraLightGreyColor,
                  ),
                  child: Text(
                    controller.chargerName,
                    style: controller.styles.mediumTextBlack,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),

                /// Charger Image
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                  child: SvgPicture.asset(
                    AssetsConfig.chargingSummary,
                    height: 0.3.sh,
                    width: 0.8.sw,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),

                /// Charging detail grid
                Obx(() {
                  return GridView.builder(
                    itemCount: controller.chargingDetails.value.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 15.r, mainAxisSpacing: 15.r, mainAxisExtent: 70.r),
                    itemBuilder: (BuildContext context, int index) {
                      return buildChargingInfoWidget(controller, index);
                    },
                  );
                }),
                SizedBox(
                  height: 10.h,
                ),
                const Spacer(),

                /// Close screen button
                AppButton(
                  title: StringConfig.home,
                  onTap: controller.onBackPress,
                  styles: controller.styles,
                  flavor: controller.flavor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Common widget  for charging detail grid
  Widget buildChargingInfoWidget(ChargingSummaryController controller, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        color: controller.flavor.appColors!.extraLightGreyColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${controller.chargingDetails.value[index][ArgumentsConfig.chargingValue].toString()} ${controller
                .chargingDetails.value[index][ArgumentsConfig.unit]}',
            style: controller.styles.mediumTextDark,
          ),
          Text(
            controller.chargingDetails.value[index][ArgumentsConfig.chargingKey].toString(),
            style: controller.styles.verySmallLightTextStyle,
          ),
        ],
      ),
    );
  }
}

