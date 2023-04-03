import 'package:cmsocpp/app/data/models/payment_history/payment_history.dart';
import 'package:cmsocpp/app/presentation/screens/payment/payment_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/common_appbar.dart';
import 'package:cmsocpp/app/presentation/widgets/progress_loader.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentHistoryScreen extends BaseStatelessWidget {
  const PaymentHistoryScreen({Key? key}) : super(key: key);

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
              left: 20.r,
              right: 20.r,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Show available balance
                Container(
                  width: 1.sw,
                  margin: EdgeInsets.only(
                    bottom: 20.r,
                  ),
                  padding: EdgeInsets.all(
                    10.r,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: ColorConfig.lightGreenColor,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConfig.balanceText,
                              style: controller.styles.titleStyle?.copyWith(color: ColorConfig.blackColor),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Obx(() {
                              return Text(
                                '${StringConfig.rupees} ${controller.balance.value}',
                                style: controller.styles.titleStyle?.copyWith(color: ColorConfig.blackColor),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              );
                            }),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      GestureDetector(
                        onTap: controller.openBottomSheet,
                        child: Container(
                          padding: EdgeInsets.all(
                            8.r,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.r,
                              color: controller.flavor.appColors!.enabledBorderColor!,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                            color: ColorConfig.primaryColor,
                          ),
                          child: Text(
                            StringConfig.addMoneyText,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: controller.styles.mediumTextDark
                                .copyWith(color: controller.flavor.appColors!.whiteColor!),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                /// Show min balance
                Container(
                  width: 1.sw,
                  margin: EdgeInsets.only(
                    bottom: 15.r,
                  ),
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.r,
                      color: controller.flavor.appColors!.enabledBorderColor!,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                    color: controller.flavor.appColors!.lightGreyColor!,
                  ),
                  child: Obx(() {
                    return Text(
                      '${StringConfig.minAmount}${controller.reservedBalance.value}${StringConfig.minAmountPostTest}',
                      style: controller.styles.mediumTextBlack,
                      textAlign: TextAlign.center,
                    );
                  }),
                ),
                SizedBox(
                  height: 10.h,
                ),

                /// Transaction list title
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      StringConfig.transactionsText,
                      style: controller.styles.textFieldLabelStyle,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 10.r,
                          right: 10.r,
                        ),
                        margin: EdgeInsets.only(
                          left: 30.r,
                          // right: 24.r,
                          bottom: 10.r,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.r,
                            color: controller.flavor.appColors!.enabledBorderColor!,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                          color: controller.flavor.appColors!.lightGreyColor!,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: Obx(() {
                            return DropdownButton(
                              style: controller.styles.mediumTextDark,
                              iconSize: 40.r,
                              elevation: 50,
                              isExpanded: true,
                              dropdownColor: controller.flavor.appColors!.popupBgColor!,
                              borderRadius: BorderRadius.circular(12.r),
                              // Initial Value
                              value: controller.initialDropdownValue.value,
                              // Down Arrow Icon
                              icon: const Icon(Icons.arrow_drop_down_rounded),
                              // Array list of items
                              items: controller.items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: controller.styles.mediumTextDark,
                                  ),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: controller.onChangeDropdownItem,
                            );
                          }),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Obx(
                  () {
                    return controller.isDateSelected.value
                        ? Obx(() {
                            return Text.rich(
                              TextSpan(
                                text: '${StringConfig.startDateText}:',
                                style: controller.styles.mediumTextDark,
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: controller.startDate.value,
                                    style: controller.styles.mediumTextLight,
                                    children: [
                                      TextSpan(
                                        text: ' ${StringConfig.endDateText}:',
                                        style: controller.styles.mediumTextDark,
                                        children: [
                                          TextSpan(
                                            text: controller.endDate.value,
                                            style: controller.styles.mediumTextLight,
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          })
                        : const SizedBox.shrink();
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),

                /// Transaction list
                Obx(
                  () {
                    return Expanded(
                      child: controller.transactionList.value.isNotEmpty
                          ? Column(
                              children: [
                                Expanded(
                                  child: RefreshIndicator(
                                    color: controller.flavor.appColors!.primaryColor!,
                                    onRefresh: () {
                                      return controller.onRefreshPage();
                                    },
                                    child: ListView.builder(
                                      controller: controller.scrollController,
                                      itemCount: controller.transactionList.value.length,
                                      itemBuilder: (BuildContext ctx, int index) {
                                        Datum details = controller.transactionList.value[index];
                                        return Container(
                                          margin: EdgeInsets.only(
                                            bottom: 15.r,
                                          ),
                                          padding: EdgeInsets.all(15.r),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1.r,
                                              color: controller.flavor.appColors!.enabledBorderColor!,
                                            ),
                                            borderRadius: BorderRadius.circular(12.r),
                                            color: controller.flavor.appColors!.lightGreyColor!,
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        buildMediumDarkTextWidget(
                                                            details.location! != ''
                                                                ? details.location!
                                                                : StringConfig.addedMoneyMsg,
                                                            controller),
                                                        SizedBox(
                                                          height: 4.h,
                                                        ),
                                                        details.paymentId != ''
                                                            ? buildMediumLightTextMultipleLineWidget(
                                                                StringConfig.paymentId, details.paymentId!, controller)
                                                            : const SizedBox.shrink(),
                                                        buildMediumLightTextMultipleLineWidget(
                                                            StringConfig.date, details.dateTime!, controller),
                                                      ],
                                                    ),
                                                  ),
                                                  Text.rich(
                                                    TextSpan(
                                                      text: StringConfig.rupeesText,
                                                      style: details.type == StringConfig.creditType
                                                          ? controller.styles.smallTextStyle
                                                          : controller.styles.smallTextStyle?.copyWith(
                                                              color: controller.flavor.appColors!.errorColor),
                                                      children: <InlineSpan>[
                                                        /// Register Navigation button
                                                        TextSpan(
                                                          text: '${details.amount}',
                                                          style: details.type == StringConfig.creditType
                                                              ? controller.styles.navigationTextStyle
                                                              : controller.styles.navigationTextStyle?.copyWith(
                                                                  color: controller.flavor.appColors!.errorColor),
                                                          children: <InlineSpan>[
                                                            /// Register Navigation button
                                                            TextSpan(
                                                              text:
                                                                  details.type == StringConfig.creditType ? ' +' : ' -',
                                                              style: details.type == StringConfig.creditType
                                                                  ? controller.styles.userImageTextStyle
                                                                  : controller.styles.userImageTextStyle?.copyWith(
                                                                      color: controller.flavor.appColors!.errorColor),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),

                                /// load more loader view
                                if (controller.isLoadMore.value)
                                  IntrinsicHeight(
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 80.h),
                                      padding: EdgeInsets.all(8.r),
                                      child: const CircularProgressIndicator(color: ColorConfig.primaryColor),
                                    ),
                                  ),
                              ],
                            )
                          : controller.isAPICallOnGoing.value
                              ? Center(
                                  child: Text(
                                    StringConfig.noTransactionFound,
                                    style: controller.styles.mediumTextBlack,
                                  ),
                                )
                              : const SizedBox.shrink(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),

        /// Progress Loader
        Obx(
          () => controller.isLoadingPaymentHistoryData.value ? ProgressLoader() : const SizedBox(),
        ),
      ],
    );
  }

  /// For Dark text
  Widget buildMediumDarkTextWidget(String text, PaymentScreenController controller) {
    return Text(
      text,
      style: controller.styles.mediumTextDark,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  /// For Light text
  Widget buildMediumLightTextWidget(String text, PaymentScreenController controller) {
    return Text(
      text,
      style: controller.styles.smallLightTextStyle,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  /// For Light text for multiple line
  Widget buildMediumLightTextMultipleLineWidget(
    String text,
    String valueText,
    PaymentScreenController controller,
  ) {
    return Text.rich(
      TextSpan(
        text: text,
        style: controller.styles.smallBlackTextStyle,
        children: <InlineSpan>[
          /// Register Navigation button
          TextSpan(
            text: valueText,
            style: controller.styles.smallLightTextStyle,
          )
        ],
      ),
    );
  }
}
