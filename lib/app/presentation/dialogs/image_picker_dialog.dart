import 'package:cmsocpp/app/presentation/screens/profile/profile_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/common_button.dart';
import 'package:cmsocpp/base_configs/configs/string_config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ImagePickerDialog extends BaseStatelessWidget {
  const ImagePickerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              ///  Camera button
              Expanded(
                child: AppButton(
                  flavor: controller.flavor,
                  styles: controller.styles,
                  title: StringConfig.connectWithChargeId,
                  onTap: controller.getImage,
                  horizontalPadding: 10.w,
                  verticalPadding: 10.h,
                  widget: Row(
                    children: [
                      Icon(
                        Icons.camera_alt_rounded,
                        color: controller.flavor.appColors!.whiteColor,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Flexible(
                        child: Text(
                          StringConfig.cameraButtonText,
                          style: controller.styles.buttonTextStyle!.copyWith(fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ),
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
                  title: StringConfig.connectWithChargeId,
                  onTap: () => controller.getImage(isFromCamera: false),
                  horizontalPadding: 10.r,
                  verticalPadding: 10.h,
                  widget: Row(
                    children: [
                      Icon(
                        Icons.image,
                        color: controller.flavor.appColors!.whiteColor,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Flexible(
                        child: Text(
                          StringConfig.galleryButtonText,
                          style: controller.styles.buttonTextStyle!.copyWith(fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
