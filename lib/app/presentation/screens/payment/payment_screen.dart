import 'package:cmsocpp/app/presentation/screens/payment/payment_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/common_appbar.dart';
import 'package:cmsocpp/app/presentation/widgets/common_button.dart';
import 'package:cmsocpp/app/presentation/widgets/progress_loader.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentScreen extends BaseStatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaymentScreenController());

    return Stack(
      children: [
        Scaffold(
          backgroundColor: controller.flavor.appColors!.appBgColor,
          appBar: CommonAppBar(
            flavor: controller.flavor,
            styles: controller.styles,
            title: StringConfig.walletText,
            showBackIcon: false,
          ),
          body: Padding(
            padding: EdgeInsets.only(
              bottom: 20.r,
              left: 20.r,
              right: 20.r,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Show available balance
                GestureDetector(
                  onTap: controller.navigateToPaymentHistory,
                  child: Container(
                    height: 90.h,
                    width: 1.sw,
                    margin: EdgeInsets.only(
                      bottom: 20.r,
                    ),
                    padding: EdgeInsets.all(
                      10.r,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.r,
                        color: controller.flavor.appColors!.enabledBorderColor!,
                      ),
                      borderRadius: BorderRadius.circular(15.r),
                      color: ColorConfig.lightGreenColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          StringConfig.availableBalance,
                          style: controller.styles.userImageTextStyle?.copyWith(color: ColorConfig.blackColor),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Obx(() {
                          return Text(
                            'Rs. ${controller.balance.value}',
                            style: controller.styles.titleStyle?.copyWith(color: ColorConfig.blackColor),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  StringConfig.payUsing,
                  style: controller.styles.textFieldLabelStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 5.h,
                ),

                /// Payment mode
                Obx(
                  () {
                    return GestureDetector(
                      onTap: controller.onChangePaymentMode,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.w),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.5.r,
                            color: controller.isRazorpaySelected.value
                                ? controller.flavor.appColors!.primaryColor!
                                : controller.flavor.appColors!.dashedLineColor!,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                          color: controller.isRazorpaySelected.value
                              ? controller.flavor.appColors!.lightPrimaryColor
                              : ColorConfig.whiteColor,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 22.r,
                              width: 22.r,
                              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.5.r,
                                  color: controller.isRazorpaySelected.value
                                      ? controller.flavor.appColors!.primaryColor!
                                      : ColorConfig.backIconColor,
                                ),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: controller.isRazorpaySelected.value
                                  ? Container(
                                      decoration: BoxDecoration(
                                        color: controller.flavor.appColors!.primaryColor,
                                        borderRadius: BorderRadius.circular(10.r),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            SizedBox(
                              width: 5.h,
                            ),
                            Image.asset(
                              AssetsConfig.razorpayImage,
                              width: 120.w,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const Spacer(),

                /// Add Money button
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        title: StringConfig.addMoneyText,
                        onTap: controller.openBottomSheet,
                        styles: controller.styles,
                        flavor: controller.flavor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80.h,
                ),
              ],
            ),
          ),
        ),

        /// Progress Loader
        Obx(
          () => controller.isLoading.value ? ProgressLoader() : const SizedBox(),
        ),
      ],
    );
  }
}
