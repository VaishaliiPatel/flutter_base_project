import 'package:cmsocpp/app/presentation/screens/profile/profile_controller.dart';
import 'package:cmsocpp/base_configs/configs/color_config.dart';
import 'package:cmsocpp/base_configs/configs/string_config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditProfileImageBottomSheet extends BaseStatelessWidget {
  const EditProfileImageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            ///  Header row
            Row(
              children: [
                /// Header widget
                Expanded(
                  child: Text(
                    StringConfig.profileImageText,
                    style: controller.styles.titleStyle,
                  ),
                ),

                SizedBox(
                  width: 10.w,
                ),

                /// Delete icon
                if (controller.imagePath.value.isNotEmpty || controller.localImageUrl.value.isNotEmpty)
                  InkWell(
                    onTap: controller.removeProfileIMageConfirmationDialog,
                    child: Container(
                      margin: EdgeInsets.all(5.r),
                      child: Icon(
                        Icons.delete,
                        size: 22.r,
                        color: controller.flavor.appColors!.titleColor,
                      ),
                    ),
                  ),

                ///  Gallery button
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                buildImageIconWidget(
                  controller: controller,
                  text: StringConfig.cameraButtonText,
                  icon: Icons.camera_alt,
                  onTap: controller.getImage,
                ),
                SizedBox(
                  width: 10.w,
                ),
                buildImageIconWidget(
                  controller: controller,
                  text: StringConfig.galleryButtonText,
                  icon: Icons.image,
                  onTap: () => controller.getImage(isFromCamera: false),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildImageIconWidget({
    required String text,
    required ProfileController controller,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.r,
                color: controller.flavor.appColors!.dashedLineColor!,
              ),
              borderRadius: BorderRadius.circular(30.r),
              color: controller.flavor.appColors!.whiteColor,
            ),
            margin: EdgeInsets.all(5.r),
            padding: EdgeInsets.all(15.r),
            child: Icon(
              icon,
              size: 22.r,
              color: ColorConfig.primaryColor,
            ),
          ),
        ),
        SizedBox(
          height: 5.r,
        ),
        Text(
          text,
          style: controller.styles.mediumTextLight,
        ),
      ],
    );
  }
}
