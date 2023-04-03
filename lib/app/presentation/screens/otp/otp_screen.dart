import 'package:cmsocpp/app/presentation/screens/otp/otp_screen_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/common_appbar.dart';
import 'package:cmsocpp/app/presentation/widgets/common_button.dart';
import 'package:cmsocpp/app/presentation/widgets/progress_loader.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:cmsocpp/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends BaseStatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OTPScreenController());

    return Stack(
      children: [
        Scaffold(
          /// App Bar
          appBar: CommonAppBar(
            flavor: controller.flavor,
            styles: controller.styles,
            title: StringConfig.otpVerificationText,
            onClick: controller.onBackPress,
          ),
          // Used ConstrainedBox, Layout builder and IntrinsicHeight to use scroll with column and expanded widgets
          body: LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.r, left: 30.r, right: 30.r, bottom: 24.r),
                    child: Form(
                      key: controller.formKey,
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            SizedBox(height: 28.h),

                            /// SubTitle
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.r),
                              child: Text(
                                '${StringConfig.otpTagLine} \n ${controller.firstTwoMobileDigit}${StringConfig.otpTagLineSubstring}${controller.lastTwoMobileDigit}',
                                style: controller.styles.subTitleStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 40.h),

                            // Get OTP number field
                            PinCodeTextField(
                              key: const Key(StringConfig.otpFieldKey),
                              onTap: () {},
                              appContext: context,
                              length: 6,
                              errorTextSpace: 30,
                              keyboardAppearance: Brightness.dark,
                              animationType: AnimationType.fade,
                              cursorColor: controller.flavor.appColors?.titleColor,
                              enablePinAutofill: false,
                              enableActiveFill: false,
                              keyboardType: TextInputType.number,
                              textStyle: controller.styles.titleStyle,
                              onCompleted: controller.validateFirebaseOTP,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              animationDuration: const Duration(milliseconds: 250),
                              autoDismissKeyboard: true,
                              validator: (value) {
                                return Validation.validateEmptyField(
                                    value: value!, errorMsg: StringConfig.emptyOTPValidation);
                              },
                              onSaved: (value) {
                                controller.otp = value!;
                              },
                              onChanged: (value) {
                                controller.otp = value;
                              },
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                activeFillColor: Colors.transparent,
                                inactiveFillColor: Colors.transparent,
                                selectedFillColor: Colors.transparent,
                                activeColor: ColorConfig.primaryColor,
                                disabledColor: ColorConfig.textFieldHintColor,
                                selectedColor: ColorConfig.primaryColor,
                                inactiveColor: ColorConfig.textFieldHintColor,
                                borderRadius: BorderRadius.circular(10.r),
                                borderWidth: 1.r,
                                fieldHeight: 50.h,
                              ),
                            ),

                            /// Resend OTP text
                            GestureDetector(
                              onTap: controller.onResendOTP,
                              child: Obx(
                                () {
                                  return controller.enableResend.value
                                      ? Text(
                                          StringConfig.resendOTPText,
                                          style: controller.styles.navigationTextMediumStyle,
                                        )
                                      : Text(
                                          '${StringConfig.resendOTPTimerText} ${controller.secondsRemaining.value} ${StringConfig.secondText}',
                                          style: controller.styles.subTitleStyle,
                                        );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),

                            /// Verify OTP field
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: AppButton(
                                title: StringConfig.verifyText,
                                flavor: controller.flavor,
                                styles: controller.styles,
                                onTap: controller.onVerifyOTP,
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
