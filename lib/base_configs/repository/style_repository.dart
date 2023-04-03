import 'package:flutter/material.dart';

import '../configs/style_config.dart';

abstract class BaseStyleRepository {
  TextStyle get titleStyle;

  TextStyle get subTitleStyle;

  TextStyle get textFieldLabelStyle;

  TextStyle get buttonTextStyle;

  TextStyle get textFieldHintStyle;

  TextStyle get appTagLineStyle;

  TextStyle get screenTagTextStyle;

  TextStyle get navigationTextStyle;

  TextStyle get navigationTextMediumStyle;

  TextStyle get termsAndConditionTextStyle;

  TextStyle get otpTextBoxStyle;

  TextStyle get timerTextStyle;

  TextStyle get smallBoldTextStyle;

  TextStyle get verySmallLightTextStyle;

  TextStyle get mediumTextDark;

  TextStyle get mediumTextLight;

  TextStyle get infoTextStyle;

  TextStyle get textFieldInputStyle;

  TextStyle get largeTextStyle;

  TextStyle get tabTextStyle;

  TextStyle get usernameTextStyle;

  TextStyle get userImageTextStyle;

  TextStyle get smallTextStyle;
}

class StyleRepository extends BaseStyleRepository {
  @override
  TextStyle get titleStyle => StyleConfig.titleStyle;

  @override
  TextStyle get subTitleStyle => StyleConfig.normalFontSize16;

  @override
  TextStyle get textFieldLabelStyle => StyleConfig.textFieldLabelStyle;

  @override
  TextStyle get textFieldHintStyle => StyleConfig.normalFontSize16;

  @override
  TextStyle get buttonTextStyle => StyleConfig.textFieldLabelStyle;

  @override
  TextStyle get appTagLineStyle => StyleConfig.normalFontSize16;

  @override
  TextStyle get screenTagTextStyle => StyleConfig.screenTagTextStyle;

  @override
  TextStyle get navigationTextStyle => StyleConfig.normalFontSize16;

  @override
  TextStyle get navigationTextMediumStyle => StyleConfig.normalFontSize16;

  @override
  TextStyle get termsAndConditionTextStyle => StyleConfig.normalFontSize14;

  @override
  TextStyle get otpTextBoxStyle => StyleConfig.boldFontSize17;

  @override
  TextStyle get timerTextStyle => StyleConfig.timerTextStyle;

  @override
  TextStyle get smallBoldTextStyle => StyleConfig.smallBoldTextStyle;

  @override
  TextStyle get verySmallLightTextStyle => StyleConfig.normalFontSize12;

  @override
  TextStyle get mediumTextDark => StyleConfig.mediumTextDark;

  @override
  TextStyle get mediumTextLight => StyleConfig.normalFontSize14;

  @override
  TextStyle get infoTextStyle => StyleConfig.normalFontSize16;

  @override
  TextStyle get textFieldInputStyle => StyleConfig.normalFontSize16;

  @override
  TextStyle get largeTextStyle => StyleConfig.largeTextStyle;

  @override
  TextStyle get tabTextStyle => StyleConfig.textFieldLabelStyle;

  @override
  TextStyle get userImageTextStyle => StyleConfig.normalFontSize12;

  @override
  TextStyle get usernameTextStyle => StyleConfig.usernameTextStyle;

  @override
  TextStyle get smallTextStyle => StyleConfig.smallTextStyle;
}
