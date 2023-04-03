import 'package:cmsocpp/app/presentation/widgets/common_appbar.dart';
import 'package:cmsocpp/app/presentation/widgets/common_button.dart';
import 'package:cmsocpp/app/presentation/widgets/common_text_field.dart';
import 'package:cmsocpp/app/presentation/widgets/progress_loader.dart';
import 'package:cmsocpp/base_configs/configs/string_config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:cmsocpp/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'reset_password_screen_controller.dart';

class ResetPasswordScreen extends BaseStatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordScreenController());

    return Stack(
      children: [
        Scaffold(
          backgroundColor: controller.flavor.appColors!.appBgColor,

          /// App Bar
          appBar: CommonAppBar(
            flavor: controller.flavor,
            styles: controller.styles,
            title: StringConfig.resetPassword,
            onClick: controller.onBack,
          ),
          body: LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.r, left: 24.r, right: 24.r, bottom: 24.r),
                    child: Form(
                      key: controller.formKey,
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4.h),

                            /// subTitle
                            Text(
                              StringConfig.pleaseEnterTheNewPassword,
                              style: controller.styles.subTitleStyle,
                            ),
                            SizedBox(height: 24.h),

                            /// OTP Text field
                            AppTextField(
                              title: StringConfig.otp,
                              isPasswordField: false,
                              styles: controller.styles,
                              flavor: controller.flavor,
                              hintText: StringConfig.otp,
                              onSave: (value) {
                                return controller.otp = value!;
                              },
                              validator: (value) {
                                return Validation.validateEmptyField(value: value!, errorMsg: '');
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
                                controller: controller.passwordController,
                                obscure: !controller.isPasswordVisible.value,
                                onSave: (value) {
                                  return controller.password = value!;
                                },
                                validator: (value) {
                                  return Validation.validatePassword(value!);
                                },
                                onPasswordChange: controller.onChangePasswordVisibility,
                              ),
                            ),

                            /// Confirm Password field
                            Obx(
                              () => AppTextField(
                                title: StringConfig.confirmPassword,
                                isPasswordField: true,
                                styles: controller.styles,
                                flavor: controller.flavor,
                                hintText: StringConfig.confirmPassword,
                                obscure: !controller.isConfirmPasswordVisible.value,
                                onSave: (value) {
                                  return controller.confirmPassword = value!;
                                },
                                validator: (value) {
                                  return Validation.validateConfirmPassword(
                                    password: controller.passwordController.text,
                                    confirmPassword: value!,
                                  );
                                },
                                onPasswordChange: controller.onChangeConfirmPasswordVisibility,
                              ),
                            ),
                            const Spacer(),

                            /// Change Password
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: AppButton(
                                  title: StringConfig.changePassword,
                                  flavor: controller.flavor,
                                  styles: controller.styles,
                                  onTap: controller.validateFields,
                                ),
                              ),
                            ),
                            SizedBox(height: 24.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        /// Progress Loader
        Obx(
          () => controller.isLoading.value ? ProgressLoader() : const SizedBox(),
        ),
      ],
    );
  }
}
