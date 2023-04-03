import 'dart:io';

import 'package:cmsocpp/app/presentation/screens/profile/profile_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/common_appbar.dart';
import 'package:cmsocpp/app/presentation/widgets/common_button.dart';
import 'package:cmsocpp/app/presentation/widgets/common_text_field.dart';
import 'package:cmsocpp/app/presentation/widgets/custom_dropdown/csc_picker.dart';
import 'package:cmsocpp/app/presentation/widgets/progress_loader.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:cmsocpp/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends BaseStatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return WillPopScope(
      onWillPop: controller.onWillPopProfile,
      child: SafeArea(
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: controller.flavor.appColors!.appBgColor,
              appBar: CommonAppBar(
                flavor: controller.flavor,
                styles: controller.styles,
                title: StringConfig.editProfileText,
                onClick: controller.onBack,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 20.r,
                    left: 20.r,
                    right: 20.r,
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80.h,
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
                            borderRadius: BorderRadius.circular(12.r),
                            color: controller.flavor.appColors!.navBgColor,
                          ),
                          child: Row(
                            children: [
                              Obx(() {
                                return GestureDetector(
                                  onTap: controller.navigateToEditProfileImage,
                                  child: Container(
                                    height: 60.r,
                                    width: 60.r,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1.r,
                                        color: controller.flavor.appColors!.enabledBorderColor!,
                                      ),
                                      borderRadius: BorderRadius.circular(30.r),
                                      color: controller.flavor.appColors!.whiteColor,
                                      image: controller.localImageUrl.value.isNotEmpty
                                          ? DecorationImage(
                                              fit: BoxFit.cover,
                                              image: FileImage(
                                                File(controller.localImageUrl.value),
                                              ),
                                            )
                                          : controller.imagePath.value.isNotEmpty
                                              ? DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    controller.imagePath.value,
                                                  ),
                                                )
                                              : const DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                    AssetsConfig.profileIcon,
                                                  ),
                                                ),
                                    ),
                                  ),
                                );
                              }),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(() {
                                      return Text(
                                        '${controller.userFirstName.value} ${controller.userLastName.value}',
                                        style: controller.styles.usernameTextStyle,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      );
                                    }),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    InkWell(
                                      onTap: controller.getImagePickerDialog,
                                      child: Obx(() {
                                        return Text(
                                          controller.imagePath.value.isNotEmpty
                                              ? StringConfig.changePhotoText
                                              : StringConfig.addPhotoText,
                                          style: controller.styles.userImageTextStyle,
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        /// Firstname Text field
                        AppTextField(
                          controller: controller.firstNameTextEditingController,
                          title: StringConfig.firstNameText,
                          styles: controller.styles,
                          flavor: controller.flavor,
                          hintText: StringConfig.firstNameText,
                          maxLength: 16,
                          validator: (value) {
                            return Validation.validateUsername(value!);
                          },
                          isCompulsoryField: false,
                        ),

                        /// Lastname Text field
                        AppTextField(
                          controller: controller.lastNameTextEditingController,
                          title: StringConfig.lastNameText,
                          styles: controller.styles,
                          flavor: controller.flavor,
                          hintText: StringConfig.lastNameText,
                          maxLength: 16,
                          validator: (value) {
                            return Validation.validateUsername(value!);
                          },
                          isCompulsoryField: false,
                        ),

                        /// Mobile Text field
                        AppTextField(
                          controller: controller.mobileTextEditingController,
                          title: StringConfig.enterMobileText,
                          textInputType: TextInputType.phone,
                          hintText: StringConfig.mobileFieldText,
                          styles: controller.styles,
                          flavor: controller.flavor,
                          isCompulsoryField: false,
                          isDisable: true,
                          inputStyle: controller.styles.textFieldHintStyle,
                        ),

                        /// Email Text field
                        AppTextField(
                          controller: controller.emailTextEditingController,
                          title: StringConfig.emailIdText,
                          styles: controller.styles,
                          flavor: controller.flavor,
                          hintText: StringConfig.emailIdText,
                          isCompulsoryField: false,
                          isDisable: true,
                          inputStyle: controller.styles.textFieldHintStyle,
                          isSpacingFromBottom: false,
                        ),
                        Obx(
                          () {
                            return controller.isScreenLoad.value
                                ? SizedBox(
                                    height: 20.h,
                                  )
                                : const SizedBox.shrink();
                          },
                        ),

                        /// Adding CSC Picker Widget in app
                        Obx(
                          () {
                            return controller.isScreenLoad.value
                                ? CSCPicker(
                                    profileController: controller,
                                    currentCountry: controller.country.value != ''
                                        ? controller.country.value
                                        : StringConfig.countryText,

                                    currentState:
                                        controller.state.value != '' ? controller.state.value : StringConfig.stateText,

                                    currentCity:
                                        controller.city.value != '' ? controller.city.value : StringConfig.cityText,

                                    /// Placeholders for dropdown search field
                                    countrySearchPlaceholder: StringConfig.countryText,
                                    stateSearchPlaceholder: StringConfig.stateText,

                                    /// Labels for dropdown
                                    countryDropdownLabel: StringConfig.countryText,
                                    stateDropdownLabel: StringConfig.stateText,

                                    /// Selected item style
                                    selectedItemStyle: controller.styles.textFieldInputStyle,

                                    /// DropdownDialog Heading style
                                    dropdownHeadingStyle: controller.styles.titleStyle,

                                    /// DropdownDialog Item style
                                    dropdownItemStyle: controller.styles.mediumTextDark,

                                    /// Dialog box radius
                                    dropdownDialogRadius: 10.r,

                                    /// Search bar radius
                                    searchBarRadius: 10.r,
                                    headerStyle: controller.styles.textFieldLabelStyle,

                                    /// Arrow color
                                    arrowColor: controller.flavor.appColors!.titleColor!,

                                    /// Dialog style
                                    popupBgColor: controller.flavor.appColors!.popupBgColor!,

                                    // For show toast on value change
                                    isShowAddressToast: controller.isShowAddressToast.value,

                                    onCountryChanged: (value) {
                                      controller.country.value = value;
                                    },
                                    onStateChanged: (value) {
                                      controller.state.value = value ?? '';
                                    },
                                    onCityChanged: (value) {
                                      controller.city.value = value ?? '';
                                    },

                                    ///Dropdown box decoration to style your dropdown selector  (USE with disabledDropdownDecoration)
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(6.r),
                                      ),
                                      color: controller.flavor.appColors!.appBgColor,
                                      border: Border.all(
                                        color: ColorConfig.enabledBorderColor,
                                        width: 1,
                                      ),
                                    ),

                                    ///Disabled Dropdown box decoration to style your dropdown selector   (USE with disabled dropdownDecoration)
                                    disabledDropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(6.r),
                                      ),
                                      color: ColorConfig.partialProgressColor,
                                      border: Border.all(
                                        color: ColorConfig.enabledBorderColor,
                                        width: 1,
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink();
                          },
                        ),

                        SizedBox(
                          height: 20.h,
                        ),

                        /// Postal code Text field
                        AppTextField(
                          controller: controller.postalCodeTextEditingController,
                          title: StringConfig.postalCodeText,
                          styles: controller.styles,
                          flavor: controller.flavor,
                          hintText: StringConfig.postalCodeText,
                          isCompulsoryField: false,
                        ),

                        /// Address Text field
                        AppTextField(
                          controller: controller.addressTextEditingController,
                          title: StringConfig.addressText,
                          styles: controller.styles,
                          flavor: controller.flavor,
                          hintText: StringConfig.addressText,
                          isCompulsoryField: false,
                          maxLines: 3,
                        ),

                        /// Update profile button
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: AppButton(
                            title: StringConfig.updateText,
                            flavor: controller.flavor,
                            styles: controller.styles,
                            onTap: controller.onSubmitProfile,
                          ),
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ),
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
}
