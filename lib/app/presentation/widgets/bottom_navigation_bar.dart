import 'package:cmsocpp/app/presentation/screens/home/home_screen_controller.dart';
import 'package:cmsocpp/base_configs/configs/string_config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomNavigationBarWidget extends BaseStatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return Container(
      height: 52.h,
      margin: EdgeInsets.only(
        bottom: 16.h,
        left: 30.w,
        right: 30.w,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.r,
          color: controller.flavor.appColors!.enabledBorderColor!,
        ),
        borderRadius: BorderRadius.circular(36.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(36.r),
        child: Obx(() {
          return BottomNavigationBar(
            iconSize: 25.r,
            elevation: 4,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: controller.flavor.appColors!.primaryColor,
            unselectedItemColor: controller.flavor.appColors!.titleColor,
            landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
            currentIndex: controller.currentIndex.value,
            backgroundColor: controller.currentIndex.value == 0
                ? controller.flavor.appColors!.appBgColor!
                : controller.flavor.appColors!.navBgColor!,
            onTap: controller.onIndexChange,
            items: <BottomNavigationBarItem>[
              bottomNavigationBarItemWidget(Icons.map_outlined, controller),
              bottomNavigationBarItemWidget(Icons.qr_code_scanner, controller),
              bottomNavigationBarItemWidget(Icons.access_time, controller),
              bottomNavigationBarItemWidget(Icons.payment, controller),
              bottomNavigationBarItemWidget(Icons.settings, controller),
            ],
          );
        }),
      ),
    );
  }

  /// For navigation item
  BottomNavigationBarItem bottomNavigationBarItemWidget(
    IconData icon,
    HomeScreenController controller,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: StringConfig.emptyText,
      activeIcon: Container(
        padding: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
          color: controller.flavor.appColors!.primaryColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Icon(icon, color: controller.flavor.appColors!.appBgColor),
      ),
    );
  }
}
