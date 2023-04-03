import 'package:cmsocpp/base_configs/controller/flavor_controller.dart';
import 'package:cmsocpp/base_configs/repository/style_repository.dart';
import 'package:cmsocpp/core/base/base_instance.dart';
import 'package:flutter/material.dart';

import '../../../../../core/base/base_controller.dart';

class StyleController extends ServiceController {
  final BaseStyleRepository _repository;
  final FlavorController _flavorController;

  StyleController({
    required BaseStyleRepository repository,
  })  : _repository = repository,
        _flavorController = BaseInstance.get();

  TextStyle? get titleStyle =>
      _repository.titleStyle.copyWith(color: _flavorController.currentFlavor.appColors!.titleColor);

  TextStyle? get subTitleStyle =>
      _repository.subTitleStyle.copyWith(color: _flavorController.currentFlavor.appColors!.subTitleColor);

  TextStyle? get textFieldLabelStyle =>
      _repository.textFieldLabelStyle.copyWith(color: _flavorController.currentFlavor.appColors!.titleColor);

  TextStyle? get buttonTextStyle =>
      _repository.buttonTextStyle.copyWith(color: _flavorController.currentFlavor.appColors!.whiteColor);

  TextStyle? get textFieldHintStyle =>
      _repository.textFieldHintStyle.copyWith(color: _flavorController.currentFlavor.appColors!.textFieldHintColor);

  TextStyle? get textFieldHintStyleDark =>
      _repository.textFieldHintStyle.copyWith(color: _flavorController.currentFlavor.appColors!.backIconColor);

  TextStyle? get appTagLineStyle =>
      _repository.appTagLineStyle.copyWith(color: _flavorController.currentFlavor.appColors!.whiteColor);

  TextStyle? get screenTagTextStyle =>
      _repository.screenTagTextStyle.copyWith(color: _flavorController.currentFlavor.appColors!.titleColor);

  TextStyle? get navigationTextStyle =>
      _repository.navigationTextStyle.copyWith(color: _flavorController.currentFlavor.appColors!.primaryColor);

  TextStyle get navigationTextMediumStyle =>
      _repository.navigationTextMediumStyle.copyWith(color: _flavorController.currentFlavor.appColors!.primaryColor);

  TextStyle get termsAndConditionTextStyle => _repository.termsAndConditionTextStyle
      .copyWith(color: _flavorController.currentFlavor.appColors!.textFieldHintColor);

  TextStyle get otpTextBoxStyle =>
      _repository.otpTextBoxStyle.copyWith(color: _flavorController.currentFlavor.appColors!.textFieldHintColor);

  TextStyle get timerTextStyle =>
      _repository.timerTextStyle.copyWith(color: _flavorController.currentFlavor.appColors!.titleColor);

  TextStyle get smallBoldTextStyle =>
      _repository.smallBoldTextStyle.copyWith(color: _flavorController.currentFlavor.appColors!.titleColor);

  TextStyle get verySmallLightTextStyle => _repository.verySmallLightTextStyle
      .copyWith(color: _flavorController.currentFlavor.appColors!.textFieldHintColor);

  TextStyle get mediumTextDark =>
      _repository.mediumTextDark.copyWith(color: _flavorController.currentFlavor.appColors!.titleColor);

  TextStyle get mediumTextLight =>
      _repository.mediumTextLight.copyWith(color: _flavorController.currentFlavor.appColors!.subTitleColor);

  TextStyle get mediumTextBlack =>
      _repository.mediumTextLight.copyWith(color: _flavorController.currentFlavor.appColors!.titleColor);

  TextStyle get mediumTextGreen =>
      _repository.mediumTextLight.copyWith(color: _flavorController.currentFlavor.appColors!.primaryColor);

  TextStyle get infoTextStyle =>
      _repository.infoTextStyle.copyWith(color: _flavorController.currentFlavor.appColors!.titleColor);

  TextStyle get textFieldInputStyle =>
      _repository.textFieldInputStyle.copyWith(color: _flavorController.currentFlavor.appColors!.titleColor);

  TextStyle get largeText =>
      _repository.largeTextStyle.copyWith(color: _flavorController.currentFlavor.appColors!.titleColor);

  TextStyle? get buttonTextStyleDark =>
      _repository.buttonTextStyle.copyWith(color: _flavorController.currentFlavor.appColors!.appBgColor);

  TextStyle? get tabTextStyle => _repository.tabTextStyle;

  TextStyle? get userImageTextStyle =>
      _repository.userImageTextStyle.copyWith(color: _flavorController.currentFlavor.appColors!.primaryColor);

  TextStyle? get usernameTextStyle =>
      _repository.usernameTextStyle.copyWith(color: _flavorController.currentFlavor.appColors!.titleColor);

  TextStyle? get warningTextStyle =>
      _repository.infoTextStyle.copyWith(color: _flavorController.currentFlavor.appColors!.errorColor);

  TextStyle? get smallBoldGreenTextStyle =>
      _repository.smallBoldTextStyle.copyWith(color: _flavorController.currentFlavor.appColors!.primaryColor);

  TextStyle? get smallBoldRedTextStyle =>
      _repository.smallBoldTextStyle.copyWith(color: _flavorController.currentFlavor.appColors!.errorColor);

  TextStyle? get smallLightTextStyle =>
      _repository.userImageTextStyle.copyWith(color: _flavorController.currentFlavor.appColors!.subTitleColor);

  TextStyle? get smallTextStyle =>
      _repository.smallTextStyle.copyWith(color: _flavorController.currentFlavor.appColors!.primaryColor);

  TextStyle? get smallBlackTextStyle =>
      _repository.userImageTextStyle.copyWith(color: _flavorController.currentFlavor.appColors!.titleColor);
}
