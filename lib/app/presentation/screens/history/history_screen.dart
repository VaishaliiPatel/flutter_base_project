import 'package:cmsocpp/app/data/models/history/history.dart';
import 'package:cmsocpp/app/presentation/screens/history/history_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/common_appbar.dart';
import 'package:cmsocpp/app/presentation/widgets/common_text_field.dart';
import 'package:cmsocpp/app/presentation/widgets/progress_loader.dart';
import 'package:cmsocpp/base_configs/configs/string_config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HistoryScreen extends BaseStatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryScreenController());
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: controller.flavor.appColors!.appBgColor,
          appBar: CommonAppBar(
            flavor: controller.flavor,
            styles: controller.styles,
            title: StringConfig.historyScreen,
            isShowRightIcon: true,
            showBackIcon: false,
            controller: controller,
            suffix: InkWell(
              onTap: controller.onSearchClick,
              child: Icon(
                Icons.search_rounded,
                color: controller.flavor.appColors!.backIconColor,
                size: 24.r,
              ),
            ),
            overlay: Obx(
              () => (!controller.showSearchIcon.value)
                  ? AppTextField(
                      styles: controller.styles,
                      hintText: StringConfig.searchText,
                      controller: controller.searchController,
                      flavor: controller.flavor,
                      focusNode: controller.searchFocus,
                      maxLength: 16,
                      contentPadding: 8.h,
                      onChanged: (value) {
                        if (controller.searchText != value) {
                          controller.onSearchTextChange(value);
                        }
                      },
                      isPasswordField: false,
                      prefix: Icon(
                        Icons.search_rounded,
                        color: controller.flavor.appColors!.textFieldHintColor,
                        size: 20.r,
                      ),
                      suffix: InkWell(
                        onTap: controller.onClearSearchClick,
                        child: Icon(
                          Icons.highlight_remove_outlined,
                          color: controller.flavor.appColors!.textFieldHintColor,
                          size: 24.r,
                        ),
                      ),
                      hintStyle: controller.styles.textFieldHintStyle,
                      inputStyle: controller.styles.mediumTextDark,
                      isSpacingFromBottom: false,
                    )
                  : const SizedBox(),
            ),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 10.r,
                  right: 10.r,
                ),
                margin: EdgeInsets.only(
                  left: 24.r,
                  right: 24.r,
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
                child: Obx(() {
                  return DropdownButtonHideUnderline(
                    child: DropdownButton(
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
                    ),
                  );
                }),
              ),
              Obx(
                () {
                  return controller.isDateSelected.value
                      ? Container(
                          margin: EdgeInsets.only(
                            bottom: 15.h,
                            left: 24.r,
                            right: 24.r,
                          ),
                          child: Obx(() {
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
                          }),
                        )
                      : const SizedBox.shrink();
                },
              ),
              Obx(
                () => Expanded(
                  child: controller.transactionList.value.isNotEmpty
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /// History List view
                            Expanded(
                              child: RefreshIndicator(
                                color: controller.flavor.appColors!.primaryColor!,
                                onRefresh: () {
                                  return controller.onRefreshPage();
                                },
                                child: ListView.builder(
                                  controller: controller.scrollController,
                                  itemCount: controller.transactionList.value.length,
                                  padding: EdgeInsets.only(left: 24.r, right: 24.r, bottom: 60.r),
                                  itemBuilder: (BuildContext ctx, int index) {
                                    Datum details = controller.transactionList.value[index];
                                    return InkWell(
                                      onTap: () => controller.navigateToHistoryDetail(details),
                                      child: Container(
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
                                            /// Station header
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: buildMediumDarkTextWidget(
                                                      details.location.toString(), controller),
                                                ),
                                                buildMediumLightTextWidget(details.startDate.toString(), controller)
                                              ],
                                            ),
                                            Divider(
                                              color: controller.flavor.appColors!.enabledBorderColor!,
                                              thickness: 1.5.r,
                                            ),
                                            SizedBox(height: 10.h),

                                            /// Charging duration
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: buildMediumLightTextWidget(
                                                      StringConfig.totalDurationText, controller),
                                                ),
                                                Expanded(
                                                  child: buildMediumDarkTextWidget(details.duration!, controller),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.h),

                                            /// Charging price
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child:
                                                      buildMediumLightTextWidget(StringConfig.chargesText, controller),
                                                ),
                                                Expanded(
                                                  child: buildMediumDarkTextWidget(
                                                      '${StringConfig.rupees} ${details.energyCharge}', controller),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.h),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            /// load more loader view
                            if (controller.isLoadMore.value)
                              IntrinsicHeight(
                                child: Padding(
                                  padding: EdgeInsets.all(8.r),
                                  child: ProgressLoader(),
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
                ),
              ),
            ],
          ),
        ),

        /// Progress loader
        Obx(() => (controller.isLoading.value) ? ProgressLoader() : const SizedBox())
      ],
    );
  }

  /// For Dark text
  Widget buildMediumDarkTextWidget(String text, HistoryScreenController controller) {
    return Text(
      text,
      style: controller.styles.mediumTextDark,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  /// For Light text
  Widget buildMediumLightTextWidget(String text, HistoryScreenController controller) {
    return Text(
      text,
      style: controller.styles.mediumTextLight,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
