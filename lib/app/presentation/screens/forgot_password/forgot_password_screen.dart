import 'package:cmsocpp/app/presentation/widgets/common_appbar.dart';
import 'package:cmsocpp/app/presentation/widgets/common_button.dart';
import 'package:cmsocpp/app/presentation/widgets/common_text_field.dart';
import 'package:cmsocpp/base_configs/configs/string_config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:cmsocpp/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/progress_loader.dart';
import 'forgot_password_screen_controller.dart';

class ForgotPasswordScreen extends BaseStatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordScreenController());

    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: controller.flavor.appColors!.appBgColor,

          /// App Bar
          appBar: CommonAppBar(
            flavor: controller.flavor,
            styles: controller.styles,
            title: StringConfig.forgotPassword,
            onClick: () {
              controller.closeScreen();
            },
          ),
          body: Padding(
            padding: EdgeInsets.only(
              top: 12.r,
              left: 24.r,
              right: 24.r,
              bottom: 24.r,
            ),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4.h),

                  /// subTitle
                  Text(
                    StringConfig.pleaseEnterYourRegisteredEmail,
                    style: controller.styles.subTitleStyle,
                  ),
                  SizedBox(height: 24.h),

                  /// Email Text field
                  AppTextField(
                    title: StringConfig.emailIdText,
                    styles: controller.styles,
                    flavor: controller.flavor,
                    hintText: StringConfig.enterEmailText,
                    textInputType: TextInputType.emailAddress,
                    controller: controller.emailController,
                    textInputAction: TextInputAction.next,
                    isSpacingFromBottom: false,
                    onSave: (value) {
                      return controller.email = value!;
                    },
                    validator: (value) {
                      return Validation.validateEmail(value!);
                    },
                  ),

                  SizedBox(height: 50.h),

                  /// Submit
                  Align(
                    alignment: Alignment.center,
                    child: AppButton(
                      title: StringConfig.submit,
                      flavor: controller.flavor,
                      styles: controller.styles,
                      horizontalPadding: 62.w,
                      onTap: controller.validateFields,
                    ),
                  ),
                  SizedBox(height: 24.h),
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
    );
  }
}
