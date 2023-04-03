import 'package:cmsocpp/app/presentation/screens/payment/payment_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/common_button.dart';
import 'package:cmsocpp/app/presentation/widgets/common_text_field.dart';
import 'package:cmsocpp/app/presentation/widgets/icon_with_circle_bg.dart';
import 'package:cmsocpp/base_configs/configs/string_config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:cmsocpp/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddMoneyToWalletBottomSheet extends BaseStatelessWidget {
  const AddMoneyToWalletBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaymentScreenController());
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///  Header row
            Row(
              children: [
                /// Header widget
                Expanded(
                  child: Text(
                    StringConfig.addMoney,
                    style: controller.styles.titleStyle,
                  ),
                ),

                SizedBox(
                  width: 10.w,
                ),

                /// Close  Icon
                IconWithCircleBg(
                  flavor: controller.flavor,
                  onClick: controller.onBack,
                ),

                ///  Gallery button
              ],
            ),
            SizedBox(
              height: 20.h,
            ),

            /// Amount Text field
            Form(
              key: controller.formKey,
              child: AppTextField(
                title: StringConfig.amountText,
                styles: controller.styles,
                flavor: controller.flavor,
                isCompulsoryField: false,
                hintText: StringConfig.enterAmountText,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 10,
                textInputType: TextInputType.number,
                onSave: (value) {
                  return controller.selectedAmountValue = value!;
                },
                validator: (value) {
                  return Validation.validateEmptyField(value: value!, errorMsg: StringConfig.paymentWarningText);
                },
                onChanged: (value) {
                  controller.selectedAmountValue = value;
                  if (value.isNotEmpty || value != "") {
                    controller.isPayEnable.value = true;
                    controller.selectedAmount = int.parse(value);
                  } else {
                    controller.isPayEnable.value = false;
                    controller.selectedAmount = 0;
                  }
                },
                isSpacingFromBottom: false,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              StringConfig.transactionFeesMsg,
              style: controller.styles.smallTextStyle?.copyWith(color: controller.flavor.appColors!.titleColor),
            ),
            SizedBox(
              height: 25.h,
            ),

            /// Pay button
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () {
                      return AppButton(
                        title: StringConfig.payText,
                        onTap: controller.isPayEnable.value ? controller.onPayment : null,
                        styles: controller.styles,
                        flavor: controller.flavor,
                        buttonColor: controller.isPayEnable.value
                            ? controller.flavor.appColors!.primaryColor
                            : controller.flavor.appColors!.enabledBorderColor,
                      );
                    },
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
