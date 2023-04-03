import 'package:cmsocpp/app/presentation/screens/map/map_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/charger_item_search_view.dart';
import 'package:cmsocpp/app/presentation/widgets/common_text_field.dart';
import 'package:cmsocpp/app/presentation/widgets/progress_loader.dart';
import 'package:cmsocpp/base_configs/configs/assets_config.dart';
import 'package:cmsocpp/base_configs/configs/string_config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:cmsocpp/utils/enums.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends BaseStatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapController());
    return Scaffold(
      backgroundColor: controller.flavor.appColors!.appBgColor,
      resizeToAvoidBottomInset: false,
      body: KeyboardDismissOnTap(
        dismissOnCapturedTaps: true,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            /// Map View
            Obx(
              () {
                return GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: controller.kMapCenter,
                    zoom: 12,
                  ),
                  markers: Set.of(controller.markers.values),
                  onMapCreated: controller.onMapCreated,
                  zoomControlsEnabled: false,
                  mapToolbarEnabled: false,
                  myLocationButtonEnabled: false,
                  compassEnabled: false,
                );
              },
            ),

            /// Top right filter and notification icon
            Padding(
              padding: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  /// Search View
                  Row(
                    children: [
                      /// Menu Icon for location list
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: controller.flavor.appColors!.appBgColor,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.menu_rounded,
                            color: controller.flavor.appColors!.titleColor,
                          ),
                          iconSize: 24.r,
                          onPressed: controller.openChargerListBottomSheet,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),

                      /// Search Bar
                      Expanded(
                        child: AppTextField(
                          styles: controller.styles,
                          hintText: StringConfig.searchText,
                          controller: controller.searchController,
                          maxLength: 16,
                          contentPadding: 5,
                          onSave: (value) {
                            return controller.searchText = value!;
                          },
                          onChanged: (value) {
                            controller.onSearchTextChange(value);
                          },
                          isPasswordField: false,
                          suffix: Obx(() {
                            return InkWell(
                              onTap: controller.onClearSearchClick,
                              child: Icon(
                                (controller.showSearchIcon.value) ? Icons.search_rounded : Icons.close,
                                color: controller.flavor.appColors!.titleColor,
                                size: 24.r,
                              ),
                            );
                          }),
                          flavor: controller.flavor,
                          hintStyle: controller.styles.textFieldHintStyle,
                          isSpacingFromBottom: false,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  /// Search list, ongoing transaction view, other buttons
                  Expanded(
                    child: Stack(
                      children: [
                        /// Refresh and on going transaction view
                        Align(
                          alignment: Alignment.topRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              /// Notification Iocn
                              /* buildTopRightIconWidget(icon: Icons.notifications_none_outlined, controller: controller, onTap: () {}),
                            SizedBox(
                              height: 10.h,
                            ),*/
                              DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  customButton: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: controller.flavor.appColors!.appBgColor,
                                    ),
                                    padding: EdgeInsets.all(12.r),
                                    child: Stack(
                                      children: [
                                        Icon(
                                          Icons.filter_alt_outlined,
                                          size: 24.r,
                                          color: controller.flavor.appColors?.titleColor,
                                        ),
                                        Positioned(
                                          // draw a red marble
                                          top: 0.0,
                                          right: 0.0,
                                          child: Obx(() {
                                            return controller.selectedFilterValue.value != StringConfig.all &&
                                                    controller.selectedFilterValue.value.isNotEmpty
                                                ? Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(9.r),
                                                        color: CommonMethods.getColorByConnectorStatus(
                                                            CommonMethods.getStatusFromApi(
                                                                controller.selectedFilterValue.value),
                                                            controller.flavor)!
                                                        // controller.flavor.appColors!.appBgColor,
                                                        ),
                                                    height: 12.r,
                                                    width: 12.r,
                                                  )
                                                : const SizedBox.shrink();
                                          }),
                                        )
                                      ],
                                    ),
                                  ),
                                  items: controller.items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Obx(() {
                                        return Text(
                                          items,
                                          overflow: TextOverflow.fade,
                                          maxLines: 1,
                                          softWrap: false,
                                          style: items ==
                                                  ((controller.selectedFilterValue.value == ConnectorStatus.inUse.value)
                                                      ? StringConfig.inUse
                                                      : controller.selectedFilterValue.value)
                                              ? controller.styles.smallBoldTextStyle
                                              : controller.styles.mediumTextDark,
                                        );
                                      }),
                                    );
                                  }).toList(),
                                  onChanged: (value) => controller.onFilterChangeDropdownItem(value),
                                  itemPadding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
                                  dropdownWidth: 160.r,
                                  dropdownPadding: EdgeInsets.symmetric(vertical: 6.r),
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: controller.flavor.appColors?.popupBgColor,
                                  ),
                                  dropdownElevation: 8,
                                  offset: const Offset(0, 8),
                                ),
                              ),

                              SizedBox(
                                height: 10.h,
                              ),

                              /// Refresh icon
                              buildTopRightIconWidget(
                                icon: Icons.refresh,
                                controller: controller,
                                onTap: controller.onRefreshClick,
                              ),
                              const Spacer(),

                              /// Ongoing Transaction View
                              Obx(
                                () {
                                  return controller.isTransactionStart.value
                                      ? GestureDetector(
                                          onTap: controller.onPressChargingContainer,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 10.r),
                                            margin: EdgeInsets.only(left: 15.r, right: 15.r, bottom: 100.r),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.r),
                                              color: controller.flavor.appColors!.appBgColor,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                // Charger Name field
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        controller.chargerName,
                                                        style: controller.styles.usernameTextStyle,
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                        softWrap: false,
                                                      ),
                                                      Text(
                                                        StringConfig.checkTheChargingProcess,
                                                        style: controller.styles.verySmallLightTextStyle,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Right arrow icon
                                                Align(
                                                  alignment: Alignment.centerRight,
                                                  child: SvgPicture.asset(
                                                    AssetsConfig.rightArrowIcon,
                                                    width: 30.r,
                                                    height: 30.r,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : const SizedBox();
                                },
                              ),
                            ],
                          ),
                        ),

                        /// Searched chargers list View
                        Obx(
                          () => (!controller.showSearchIcon.value) ? searchListView(controller) : const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Progress Loader
            Obx(
              () => controller.isLoading.value ? ProgressLoader() : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  // view for showing searched items
  Widget searchListView(MapController controller) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: controller.flavor.appColors!.appBgColor,
        surfaceTintColor: controller.flavor.appColors!.appBgColor,
        child: controller.searchedChargerList.value.isNotEmpty
            ? Padding(
                padding: EdgeInsets.all(8.r),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.searchedChargerList.value.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChargerItemSearchView(
                      chargerItem: controller.searchedChargerList.value[index],
                      flavor: controller.flavor,
                      styles: controller.styles,
                      onClick: () {
                        controller.onChargePointItemClick(controller.searchedChargerList.value[index]);
                      },
                    );
                  },
                ),
              )
            : IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.h),
                  child: Text(
                    textAlign: TextAlign.center,
                    StringConfig.noChargersFound,
                    style: controller.styles.mediumTextBlack,
                  ),
                ),
              ),
      ),
    );
  }

  /// Common widget for top right icons
  Widget buildTopRightIconWidget(
      {required MapController controller, required IconData icon, required VoidCallback onTap}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: controller.flavor.appColors!.appBgColor,
      ),
      padding: EdgeInsets.all(12.r),
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: controller.flavor.appColors!.titleColor,
          size: 24.r,
        ),
      ),
    );
  }
}
