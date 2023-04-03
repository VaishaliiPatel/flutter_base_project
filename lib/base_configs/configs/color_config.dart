import 'package:cmsocpp/app/data/models/color/dynamic_color_model.dart';
import 'package:cmsocpp/base_configs/configs/app_colors.dart';
import 'package:flutter/material.dart';

abstract class BaseColorConfig {
  DynamicColorModel<AppColors> get colorScheme;

  DynamicColorModel<Color> get primary;
}

class ColorConfig extends BaseColorConfig {
  static const primaryColor = Color(0xFF439C39);
  static const darkBlue = Color(0xFF363853);
  static const backIconColor = Color(0xFF707070);
  static const subTitleColor = Color(0xFF919191);
  static const enabledBorderColor = Color(0xFFD7D9D7);
  static const focusedBorderColor = Color(0xFFEAEBF5);
  static const errorBorderColor = Color(0xFFF44336);
  static const snackBarErrorColor = Color(0xCCE35A50);
  static const snackBarSuccessColor = Color(0xCC439C39);
  static const whiteColor = Color(0xFFFFFFFF);
  static const textFieldHintColor = Color(0xFFA6A6A6);
  static const errorColor = Color(0xFFF44336);
  static const blackColor = Color(0xff242424);
  static const loaderBgColor = Color(0x4D9F9D9D);
  static const scannerLineColor = Color(0xFF15E353);
  static const dropdownBorderColor = Color(0xFFE0E0E0);
  static const cancelButtonTextColor = Color(0xFFF14242);
  static const dashedLineColor = Color(0x402C302E);
  static const partialProgressColor = Color(0xFFE3E3E3);
  static const lightGreyColor = Color(0xFFF7F7F7);
  static const tabBgColor = Color(0xFFF1F0F0);
  static const lightGreyForDetailBg = Color(0xFFE2E2E2);
  static const lightBlackColor = Color(0xff000000);
  static const popupBgColor = Color(0xFF505050);
  static const lightGreenColor = Color(0xFFD6E7D4);
  static const primaryColorMedium = Color(0xCC439C39);
  static const primaryColorLight = Color(0x33439C39);
  static const dropDownItemBgColor = Color(0xFFF2F2F2);
  static const availableStatusColor = Color(0xFF439C39);
  static const faultyStatusColor = Color(0xFFF14242);
  static const inUseStatusColor = Color(0xFFf3c019);
  static const unAvailableStatusColor = Color(0xFFA6A6A6);
  static const extraLightGrey = Color(0x4DE2E2E2);
  static const freeStatusColor = Color(0xFF269CFC);
  static const paidStatusColor = Color(0xFFFF7300);

  @override
  DynamicColorModel<AppColors> get colorScheme => const DynamicColorModel(
        light: AppColors(
          titleColor: blackColor,
          backIconColor: backIconColor,
          subTitleColor: subTitleColor,
          textFieldHintColor: textFieldHintColor,
          primaryColor: primaryColor,
          buttonTextColor: whiteColor,
          appBgColor: whiteColor,
          lightGreyColor: lightGreyColor,
          enabledBorderColor: focusedBorderColor,
          whiteColor: whiteColor,
          partialProgressColor: partialProgressColor,
          navBgColor: partialProgressColor,
          popupBgColor: partialProgressColor,
          tabBgColor: tabBgColor,
          selectedTabColor: whiteColor,
          dashedLineColor: dashedLineColor,
          dialogColor: whiteColor,
          lightGreyForDetailBg: lightGreyForDetailBg,
          loaderBgColor: loaderBgColor,
          errorColor: errorColor,
          walletColor: primaryColor,
          lightPrimaryColor: primaryColorLight,
          enableButtonColor: blackColor,
          disableButtonColor: enabledBorderColor,
          dropdownBorderColor: dropdownBorderColor,
          dropDownItemBgColor: dropDownItemBgColor,
          faultyStatusColor: faultyStatusColor,
          availableStatusColor: availableStatusColor,
          inUseStatusColor: inUseStatusColor,
          unAvailableStatusColor: unAvailableStatusColor,
          extraLightGreyColor: lightGreyForDetailBg,
        ),
        dark: AppColors(
          titleColor: whiteColor,
          backIconColor: whiteColor,
          subTitleColor: subTitleColor,
          textFieldHintColor: textFieldHintColor,
          primaryColor: primaryColor,
          buttonTextColor: darkBlue,
          appBgColor: blackColor,
          lightGreyColor: lightBlackColor,
          enabledBorderColor: focusedBorderColor,
          whiteColor: whiteColor,
          partialProgressColor: loaderBgColor,
          navBgColor: blackColor,
          popupBgColor: popupBgColor,
          tabBgColor: loaderBgColor,
          selectedTabColor: blackColor,
          dashedLineColor: loaderBgColor,
          dialogColor: popupBgColor,
          lightGreyForDetailBg: lightGreyForDetailBg,
          loaderBgColor: loaderBgColor,
          errorColor: errorColor,
          walletColor: whiteColor,
          lightPrimaryColor: primaryColorMedium,
          enableButtonColor: primaryColor,
          disableButtonColor: enabledBorderColor,
          dropdownBorderColor: dropdownBorderColor,
          dropDownItemBgColor: loaderBgColor,
          faultyStatusColor: faultyStatusColor,
          availableStatusColor: availableStatusColor,
          inUseStatusColor: inUseStatusColor,
          unAvailableStatusColor: unAvailableStatusColor,
          extraLightGreyColor: extraLightGrey,
        ),
      );

  @override
  DynamicColorModel<Color> get primary => const DynamicColorModel(
        light: primaryColor,
        dark: primaryColor,
      );
}

