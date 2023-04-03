import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/local_storage_controller.dart';
import 'package:cmsocpp/core/base/base_instance.dart';

enum Endpoints { items, details }

abstract class FlavorConfig {
  BaseFlavorConfig get flavorBacancy;

  BaseFlavorConfig get currentFlavor;
}

class BaseFlavorConfig {
  String baseUrl = '';
  AppColors? appColors;
  int companyId = 0;

  BaseFlavorConfig();
}

class FlavorConfigBacancy implements FlavorConfig {
  final LocalStorageController localStorage = BaseInstance.get();
  final BaseFlavorConfig _flavor = BaseFlavorConfig()
    ..companyId = 1
    ..baseUrl = ApiConfig.baseUrlBacancy
    ..appColors = const AppColors(
      titleColor: ColorConfig.blackColor,
      backIconColor: ColorConfig.backIconColor,
      subTitleColor: ColorConfig.subTitleColor,
      textFieldHintColor: ColorConfig.textFieldHintColor,
      primaryColor: ColorConfig.primaryColor,
      buttonTextColor: ColorConfig.whiteColor,
      appBgColor: ColorConfig.whiteColor,
      lightGreyColor: ColorConfig.lightGreyColor,
      enabledBorderColor: ColorConfig.focusedBorderColor,
      whiteColor: ColorConfig.whiteColor,
      partialProgressColor: ColorConfig.partialProgressColor,
      navBgColor: ColorConfig.partialProgressColor,
      popupBgColor: ColorConfig.whiteColor,
      tabBgColor: ColorConfig.tabBgColor,
      selectedTabColor: ColorConfig.whiteColor,
      dashedLineColor: ColorConfig.dashedLineColor,
      dialogColor: ColorConfig.whiteColor,
      lightGreyForDetailBg: ColorConfig.lightGreyForDetailBg,
      loaderBgColor: ColorConfig.loaderBgColor,
      errorColor: ColorConfig.errorColor,
      walletColor: ColorConfig.primaryColor,
      lightPrimaryColor: ColorConfig.primaryColorLight,
      enableButtonColor: ColorConfig.blackColor,
      disableButtonColor: ColorConfig.enabledBorderColor,
      dropdownBorderColor: ColorConfig.dropdownBorderColor,
      dropDownItemBgColor: ColorConfig.dropDownItemBgColor,
      faultyStatusColor: ColorConfig.faultyStatusColor,
      availableStatusColor: ColorConfig.availableStatusColor,
      inUseStatusColor: ColorConfig.inUseStatusColor,
      unAvailableStatusColor: ColorConfig.unAvailableStatusColor,
      extraLightGreyColor: ColorConfig.lightGreyForDetailBg,
    );

  @override
  BaseFlavorConfig get flavorBacancy => _flavor;

  @override
  BaseFlavorConfig get currentFlavor => _flavor
    ..appColors = localStorage.getIsDarkTheme()! ? ColorConfig().colorScheme.dark : ColorConfig().colorScheme.light;
}
