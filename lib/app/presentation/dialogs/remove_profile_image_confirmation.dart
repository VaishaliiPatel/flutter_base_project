import 'package:cmsocpp/app/presentation/screens/profile/profile_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/common_button.dart';
import 'package:cmsocpp/base_configs/configs/string_config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RemoveProfileConfirmationDialog extends BaseStatelessWidget {
  const RemoveProfileConfirmationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Column(
      children: [
        Row(
          children: [
            ///  Camera button
            Expanded(
              child: AppButton(
                flavor: controller.flavor,
                styles: controller.styles,
                title: StringConfig.deleteText,
                onTap: controller.onDeleteProfileImage,
                horizontalPadding: 10.w,
                verticalPadding: 10.h,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),

            ///  Gallery button
            Expanded(
              child: AppButton(
                flavor: controller.flavor,
                styles: controller.styles,
                title: StringConfig.cancelText,
                onTap: controller.onClosePage,
                horizontalPadding: 10.r,
                verticalPadding: 10.h,
                buttonColor: controller.flavor.appColors!.backIconColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
