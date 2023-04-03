import 'package:cmsocpp/app/presentation/screens/qr_scanner/qr_scanner_screen_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/common_button.dart';
import 'package:cmsocpp/app/presentation/widgets/common_text_field.dart';
import 'package:cmsocpp/base_configs/configs/string_config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:cmsocpp/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomChargerIdDialog extends BaseStatelessWidget {
  const CustomChargerIdDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QrScannerScreenController());
    return SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            /// Charger Id input field
            AppTextField(
              initialValue: controller.chargeId,
              styles: controller.styles,
              flavor: controller.flavor,
              hintStyle: controller.styles.textFieldHintStyleDark,
              hintText: StringConfig.chargerId,
              onSave: (value) {
                return controller.chargeId = value!;
              },
              validator: (value) {
                return Validation.validateEmptyField(value: value!, errorMsg: StringConfig.validateChargerIdField);
              },
            ),

            ///  Submit button
            AppButton(
              title: StringConfig.submit,
              styles: controller.styles,
              flavor: controller.flavor,
              onTap: controller.onSubmitChargerId,
            ),
            SizedBox(
              height: 10.r,
            ),

            ///  Cancel text button
            TextButton(
              onPressed: controller.onCancel,
              child: Text(
                StringConfig.cancelText,
                style: controller.styles.textFieldLabelStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
