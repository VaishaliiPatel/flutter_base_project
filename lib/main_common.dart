import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app.dart';
import 'base_configs/controller/firebase_controller.dart';
import 'base_configs/controller/utility_controller.dart';
import 'core/base/base_instance.dart';
import 'startup.dart';
import 'utils/enums.dart';

void mainCommon(Flavors flavors) {
  runZonedGuarded<Future<void>>(() async {
    await ScreenUtil.ensureScreenSize();

    await Startup.initFirebase();

    FirebaseController controller = BaseInstance.get();
    FlutterError.onError = controller.recordFlutterError;
    await Startup.init();

    UtilityController utility = BaseInstance.get();

    switch (flavors) {
      case Flavors.bacancy:
        runApp(MyApp(utility.flavor.flavorBacancy));
        break;
      default:
        runApp(MyApp(utility.flavor.flavorBacancy));
        break;
    }
  }, (error, stack) {
    FirebaseController controller = BaseInstance.get();
    controller.recordError(error, stack);
  });
}

