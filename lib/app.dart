import 'package:cmsocpp/core/base/base_instance.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'base_configs/configs/config.dart';
import 'base_configs/controller/utility_controller.dart';
import 'core/base/base_widget.dart';

class MyApp extends BaseStatelessWidget {
  final BaseFlavorConfig config;

  MyApp(this.config, {Key? key}) : super(key: key);

  final UtilityController utility = BaseInstance.get();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // For add app native status bar
    CommonMethods.getAppStatusBarTheme(utility: utility);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: utility.navigation.initialRoute.route,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: AppConfig.fontFamily,
        scaffoldBackgroundColor: utility.flavor.currentFlavor.appColors!.appBgColor,
      ),
      getPages: utility.navigation.availableNavigation
          .map((e) => GetPage(
                name: e.route,
                page: () => e.screen,
                binding: e.bindings,
              ))
          .toList(),
      navigatorObservers: [
        utility.firebase.navigationObserver,
      ],
      defaultTransition: Transition.noTransition,
      builder: (context, child) {
        ScreenUtil.init(
          context,
          designSize: const Size(360, 690),
        );
        return SafeArea(child: child!);
      },
    );
  }
}
