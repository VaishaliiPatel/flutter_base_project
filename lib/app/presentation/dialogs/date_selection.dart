import 'package:cmsocpp/app/presentation/screens/history/history_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/common_button.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DateSelectionDialog extends BaseStatelessWidget {
  const DateSelectionDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryScreenController());
    return Column(
      children: [
        Row(
          children: [
            ///  Camera button
            Expanded(
              child: TextFormField(
                readOnly: true,
                //the method for opening data picker
                onTap: () => controller.openStartDatePicker(context),
                controller: controller.startDateTextEditingController,
                style: controller.styles.textFieldInputStyle,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  hintText: StringConfig.startDateText,
                  counterText: '',
                  contentPadding: EdgeInsets.only(top: 14.r, bottom: 14.r, left: 10.r, right: 10.r),
                  hintStyle: controller.styles.textFieldHintStyle,
                  //the controller
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),

            ///  Gallery button
            Expanded(
              child: TextFormField(
                readOnly: true,
                controller: controller.endDateTextEditingController,
                //the method for opening data picker
                onTap: () => controller.openEndDatePicker(context),
                style: controller.styles.textFieldInputStyle,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  hintText: StringConfig.endDateText,
                  counterText: '',
                  contentPadding: EdgeInsets.only(top: 14.r, bottom: 14.r, left: 10.r, right: 10.r),
                  hintStyle: controller.styles.textFieldHintStyle,
                  //the controller
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.r,
        ),
        Obx(() {
          return AppButton(
            flavor: controller.flavor,
            styles: controller.styles,
            title: StringConfig.submit,
            buttonColor: controller.isStartDateSelected.value && controller.isEndDateSelected.value
                ? ColorConfig.primaryColor
                : controller.flavor.appColors!.disableButtonColor,
            onTap:
                controller.isStartDateSelected.value && controller.isEndDateSelected.value ? controller.onSubmit : null,
            horizontalPadding: 10.w,
            verticalPadding: 10.h,
          );
        }),
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
    );
  }
}
