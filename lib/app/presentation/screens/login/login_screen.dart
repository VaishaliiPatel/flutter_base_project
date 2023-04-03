import 'package:cmsocpp/app/presentation/screens/login/login_screen_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/auth_header.dart';
import 'package:cmsocpp/app/presentation/widgets/common_button.dart';
import 'package:cmsocpp/app/presentation/widgets/common_text_field.dart';
import 'package:cmsocpp/app/presentation/widgets/common_text_span_field.dart';
import 'package:cmsocpp/app/presentation/widgets/progress_loader.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:cmsocpp/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends BaseStatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginScreenController());

    return SafeArea(
      child: WillPopScope(
        onWillPop: controller.onMobileBackPress,
        child: Scaffold(
          backgroundColor: controller.flavor.appColors!.appBgColor,
          body: Stack(
            children: [
              /// Login form View
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        /// App logo and title text
                        AuthHeaderWidget(
                          styles: controller.styles,
                          title: StringConfig.welcomeBackText,
                        ),

                        /// Email Text field
                        AppTextField(
                          title: StringConfig.emailIdText,
                          styles: controller.styles,
                          flavor: controller.flavor,
                          hintText: StringConfig.enterEmailText,
                          textInputType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onSave: (value) {
                            return controller.email = value!;
                          },
                          validator: (value) {
                            return Validation.validateEmail(value!);
                          },
                        ),

                        /// Password Text field
                        Obx(
                          () => AppTextField(
                            title: StringConfig.passwordText,
                            isPasswordField: true,
                            styles: controller.styles,
                            hintText: StringConfig.passwordText,
                            textInputAction: TextInputAction.done,
                            obscure: !controller.isPasswordVisible.value,
                            flavor: controller.flavor,
                            onSave: (value) {
                              return controller.password = value!;
                            },
                            validator: (value) {
                              return Validation.validatePasswordOnLogin(value!);
                            },
                            onPasswordChange: controller.onChangePasswordVisibility,
                          ),
                        ),

                        /// Forgot password text
                        GestureDetector(
                          onTap: controller.navigateToForgotPasswordScreen,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              StringConfig.forgotPasswordText,
                              style: controller.styles.navigationTextStyle,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),

                        /// Continue login button
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: AppButton(
                            title: StringConfig.continueText,
                            onTap: controller.validateFields,
                            styles: controller.styles,
                            flavor: controller.flavor,
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),

                        /// Register navigation
                        GestureDetector(
                          onTap: controller.navigateToRegisterScreen,
                          child: AppTextSpan(
                            title: StringConfig.registerAccountText,
                            subTitle: StringConfig.registerText,
                            navigationTextStyle: controller.styles.navigationTextMediumStyle,
                            infoTextStyle: controller.styles.infoTextStyle,
                          ),
                        )
                      ],
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
      ),
    );
  }
}
