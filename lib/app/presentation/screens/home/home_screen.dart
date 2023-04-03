import 'package:cmsocpp/app/presentation/screens/home/home_screen_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/bottom_navigation_bar.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends BaseStatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return WillPopScope(
      onWillPop: controller.onMobileBackPress,
      child: Scaffold(
        backgroundColor: controller.flavor.appColors!.appBgColor,
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: Obx(() {
          return controller.widgetOptions[controller.currentIndex.value];
          // return IndexedStack(
          //   index: controller.currentIndex.value,
          //   children: controller.widgetOptions,
          // );
        }),
        bottomNavigationBar: const BottomNavigationBarWidget(),
      ),
    );
  }
}
