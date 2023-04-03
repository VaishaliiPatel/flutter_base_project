import 'package:cmsocpp/app/presentation/screens/payment/payment_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/common_appbar.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentSummaryScreen extends BaseStatelessWidget {
  const PaymentSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaymentScreenController());
    return WillPopScope(
      onWillPop: controller.onWillPopFormSummary,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: controller.flavor.appColors!.appBgColor,
          appBar: CommonAppBar(
            flavor: controller.flavor,
            styles: controller.styles,
            title: StringConfig.paymentSummary,
            onClick: controller.onWillPopFormSummary,
          ),
          body: Padding(
            padding: EdgeInsets.only(
              left: 20.r,
              right: 20.r,
            ),
            child: Column(
              children: [
                /// Show Payment value
                Container(
                  // height: 90.h,
                  width: 1.sw,
                  margin: EdgeInsets.only(
                    bottom: 20.r,
                  ),
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.r,
                      color: controller.flavor.appColors!.enabledBorderColor!,
                    ),
                    borderRadius: BorderRadius.circular(15.r),
                    color: controller.flavor.appColors!.lightGreyColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Icon(
                        Icons.check_circle_rounded,
                        color: controller.flavor.appColors!.primaryColor!,
                        size: 30.r,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Rs. ${controller.selectedAmount}',
                        style: controller.styles.titleStyle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        StringConfig.paymentSummaryMsg,
                        style: controller.styles.mediumTextBlack,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),

                /// Divider and payment icon
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 10.0,
                        width: 20.r,
                        child: Center(
                          child: Container(
                            margin: EdgeInsetsDirectional.only(start: 1.0.r, end: 1.0.r),
                            height: 2.0,
                            color: controller.flavor.appColors!.enabledBorderColor!,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // height: 30.r,
                      // width: 30.r,
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: controller.flavor.appColors!.enabledBorderColor!,
                          width: 2.r,
                        ),
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: Image.asset(
                        AssetsConfig.walletIcon,
                        width: 20.w,
                        height: 20.h,
                        color: controller.flavor.appColors!.walletColor,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 10.0,
                        width: 20.r,
                        child: Center(
                          child: Container(
                            margin: EdgeInsetsDirectional.only(start: 1.0.r, end: 1.0.r),
                            height: 2.0,
                            color: controller.flavor.appColors!.enabledBorderColor!,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),

                /// Payment details
                Text(
                  StringConfig.paymentDetails,
                  style: controller.styles.mediumTextDark,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  controller.paymentTime,
                  style: controller.styles.mediumTextLight,
                  textAlign: TextAlign.center,
                ),
                Text(
                  '${StringConfig.transactionId} ${controller.paymentId}',
                  style: controller.styles.mediumTextBlack,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  StringConfig.needHelpText,
                  style: controller.styles.mediumTextGreen.copyWith(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
