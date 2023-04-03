import 'package:cmsocpp/app/presentation/screens/register/register_screen_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/auth_header.dart';
import 'package:cmsocpp/app/presentation/widgets/common_button.dart';
import 'package:cmsocpp/app/presentation/widgets/common_text_field.dart';
import 'package:cmsocpp/app/presentation/widgets/common_text_span_field.dart';
import 'package:cmsocpp/app/presentation/widgets/progress_loader.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:cmsocpp/utils/validation.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterScreen extends BaseStatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegisterScreenController controller = Get.put(RegisterScreenController());
    return SafeArea(
      child: WillPopScope(
        onWillPop: controller.onMobileBackPress,
        child: Scaffold(
          backgroundColor: controller.flavor.appColors!.appBgColor,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// App logo and title text
                            AuthHeaderWidget(
                              styles: controller.styles,
                              title: StringConfig.createAccountText,
                            ),

                            /// Firstname Text field
                            AppTextField(
                              title: StringConfig.firstNameText,
                              styles: controller.styles,
                              flavor: controller.flavor,
                              hintText: StringConfig.firstNameText,
                              maxLength: 16,
                              onSave: (value) {
                                return controller.firstName = value!;
                              },
                              validator: (value) {
                                return Validation.validateUsername(value!);
                              },
                            ),

                            /// Lastname Text field
                            AppTextField(
                              title: StringConfig.lastNameText,
                              styles: controller.styles,
                              flavor: controller.flavor,
                              hintText: StringConfig.lastNameText,
                              maxLength: 16,
                              onSave: (value) {
                                return controller.lastName = value!;
                              },
                              validator: (value) {
                                return Validation.validateUsername(value!);
                              },
                            ),

                            /// Mobile title field
                            Text(
                              '${StringConfig.enterMobileText}*',
                              style: controller.styles.textFieldLabelStyle!,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),

                            /// Country code and mobile field
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// Country selection field
                                Expanded(
                                  flex: 2,
                                  child: AppTextField(
                                    focusNode: FocusNode(),
                                    styles: controller.styles,
                                    flavor: controller.flavor,
                                    prefix: CountryListPick(
                                      appBar: AppBar(
                                        backgroundColor: ColorConfig.primaryColor,
                                        leading: InkWell(
                                          onTap: controller.onBackPress,
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(12.r, 8.r, 12.r, 8.r),
                                            child: Icon(
                                              Icons.arrow_back_ios,
                                              size: 20.r,
                                              color: controller.flavor.appColors!.appBgColor,
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          StringConfig.pickYourCountryText,
                                          style: controller.styles.titleStyle
                                              ?.copyWith(color: controller.flavor.appColors?.appBgColor),
                                        ),
                                      ),
                                      pickerBuilder: (context, CountryCode? countryCode) {
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              constraints: BoxConstraints(
                                                maxWidth: 25.r,
                                                minWidth: 20.r,
                                              ),
                                              child: Image.asset(
                                                countryCode!.flagUri!,
                                                package: StringConfig.countryPickerPackageName,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            // Text(countryCode.code!),
                                            Text(
                                              countryCode.dialCode!,
                                              style: TextStyle(
                                                color: controller.flavor.appColors!.titleColor,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                      theme: CountryTheme(
                                        isShowFlag: true,
                                        isShowTitle: false,
                                        isShowCode: true,
                                        isDownIcon: false,
                                        showEnglishName: true,
                                        labelColor: ColorConfig.primaryColor,
                                        alphabetTextColor: ColorConfig.primaryColor,
                                        alphabetSelectedTextColor: ColorConfig.whiteColor,
                                        alphabetSelectedBackgroundColor: ColorConfig.primaryColor,
                                      ),
                                      initialSelection: '+91',
                                      onChanged: (CountryCode? code) {
                                        controller.countryDialCode.value = int.parse((code!.dialCode!).substring(0));
                                      },
                                      useUiOverlay: true,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),

                                /// Mobile Text field
                                Expanded(
                                  flex: 5,
                                  child: AppTextField(
                                    focusNode: FocusNode(),
                                    textInputType: TextInputType.phone,
                                    hintText: StringConfig.mobileFieldText,
                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                    validator: (value) {
                                      return controller.validateMobileNumber(value!);
                                    },
                                    onSave: (value) {
                                      return controller.mobile = value!;
                                    },
                                    maxLength: 15,
                                    styles: controller.styles,
                                    flavor: controller.flavor,
                                  ),
                                ),
                              ],
                            ),

                            /// Email Text field
                            AppTextField(
                              title: StringConfig.emailIdText,
                              styles: controller.styles,
                              flavor: controller.flavor,
                              hintText: StringConfig.emailIdText,
                              onSave: (value) {
                                return controller.email = value!;
                              },
                              validator: (value) {
                                return controller.validateEmailAddress(value!);
                              },
                            ),

                            /// Password Text field
                            Obx(
                              () => AppTextField(
                                title: StringConfig.passwordText,
                                isPasswordField: true,
                                styles: controller.styles,
                                flavor: controller.flavor,
                                hintText: StringConfig.passwordText,
                                obscure: !controller.isPasswordVisible.value,
                                maxLength: 20,
                                onPasswordChange: controller.onChangePasswordVisibility,
                                onChanged: (value) => controller.password.value = value,
                                onSave: (value) {
                                  return controller.password.value = value!;
                                },
                                validator: (value) {
                                  return Validation.validatePassword(value!);
                                },
                              ),
                            ),

                            /// Confirm Password Text field
                            Obx(
                              () {
                                return AppTextField(
                                  title: StringConfig.confirmPasswordFieldText,
                                  isPasswordField: true,
                                  styles: controller.styles,
                                  flavor: controller.flavor,
                                  hintText: StringConfig.confirmPasswordFieldText,
                                  obscure: !controller.isConfirmPasswordVisible.value,
                                  maxLength: 20,
                                  validator: (value) {
                                    return Validation.validateConfirmPassword(
                                        password: controller.password.value, confirmPassword: value!);
                                  },
                                  onSave: (value) {
                                    return controller.confirmPassword = value!;
                                  },
                                  onPasswordChange: controller.onChangeConfirmPasswordVisibility,
                                  isSpacingFromBottom: false,
                                );
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ),

                      /// Terms and Condition checkbox
                      Padding(
                        padding: EdgeInsets.only(left: 20.r),
                        child: Row(
                          children: [
                            Obx(
                              () => Theme(
                                data: ThemeData(
                                  unselectedWidgetColor: controller.flavor.appColors!.titleColor,
                                ),
                                child: Checkbox(
                                  onChanged: controller.onCheck,
                                  value: controller.isChecked.value,
                                  activeColor: ColorConfig.primaryColor,
                                ),
                              ),
                            ),
                            Text(
                              StringConfig.tAndCText,
                              style: controller.styles.termsAndConditionTextStyle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),

                      /// Continue register button
                      Align(
                        alignment: Alignment.center,
                        child: AppButton(
                          title: StringConfig.registerText,
                          flavor: controller.flavor,
                          styles: controller.styles,
                          onTap: controller.validateAndNavigateToOTPScreen,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),

                      /// Navigate to login screen text
                      GestureDetector(
                        onTap: controller.navigateToLoginScreen,
                        child: AppTextSpan(
                          title: StringConfig.loginAccountText,
                          subTitle: StringConfig.loginText,
                          navigationTextStyle: controller.styles.navigationTextMediumStyle,
                          infoTextStyle: controller.styles.infoTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
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
          ),
        ),
      ),
    );
  }
}
