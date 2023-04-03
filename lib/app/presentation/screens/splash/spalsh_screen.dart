import 'package:cmsocpp/app/presentation/screens/splash/splash_screen_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/common_button.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends BaseStatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SplashScreenController controller = Get.put(SplashScreenController());

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          /// Background Image
          Image.asset(
            AssetsConfig.splashScreenBg,
            fit: BoxFit.cover,
            height: 1.sh,
            width: 1.sw,
          ),
          Column(
            children: [
              SizedBox(height: 50.h),

              /// App Icon
              SvgPicture.asset(
                AssetsConfig.appIcon,
                width: 0.55.sw,
              ),
              const Spacer(),

              /// Splash screen tag line
              Text(StringConfig.splashScreenTagLineText, style: controller.styles.appTagLineStyle),
              SizedBox(height: 20.h),

              /// Continue button
              AppButton(
                title: StringConfig.getStartedText,
                styles: controller.styles,
                flavor: controller.flavor,
              ),
              SizedBox(height: 60.h),
            ],
          ),
        ],
      ),
    );
  }
}
