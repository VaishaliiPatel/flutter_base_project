import 'dart:io';

import 'package:cmsocpp/app/presentation/screens/profile/profile_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/common_appbar.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditProfileImageScreen extends BaseStatelessWidget {
  const EditProfileImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    double appBarHeight = AppBar().preferredSize.height;
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: controller.flavor.appColors!.appBgColor,
          appBar: CommonAppBar(
            flavor: controller.flavor,
            styles: controller.styles,
            title: StringConfig.editProfileImageText,
            onClick: controller.onClosePage,
            isShowRightIcon: true,
            suffix: Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: controller.openBottomSheetForEditProfile,
                  child: Padding(
                    padding: EdgeInsets.all(5.r),
                    child: Icon(
                      Icons.edit,
                      size: 22.r,
                      color: controller.flavor.appColors!.titleColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Center(
            child: Obx(() {
              return AspectRatio(
                aspectRatio: 1,
                child: Container(
                  alignment: Alignment.center,
                  // height: 1.sw,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.r,
                      color: controller.flavor.appColors!.titleColor!,
                    ),
                    color:  controller.flavor.appColors!.titleColor!,
                    image: controller.localImageUrl.value.isNotEmpty
                        ? DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(
                        File(controller.localImageUrl.value),
                      ),
                    )
                        : controller.imagePath.value.isNotEmpty
                        ? DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        controller.imagePath.value,
                      ),
                    )
                        : const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        AssetsConfig.profileIcon,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: appBarHeight),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
