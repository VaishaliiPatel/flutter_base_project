import 'package:cmsocpp/base_configs/controller/flavor_controller.dart';
import 'package:cmsocpp/core/base/base_instance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressLoader extends StatelessWidget {
  ProgressLoader({Key? key}) : super(key: key);
  final FlavorController _flavor = BaseInstance.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _flavor.currentFlavor.appColors!.loaderBgColor,
      alignment: Alignment.center,
      child: SizedBox(
        height: 42.r,
        width: 42.r,
        child: CircularProgressIndicator(
          strokeWidth: 4.5.r,
          backgroundColor: _flavor.currentFlavor.appColors!.primaryColor!.withOpacity(0.6),
          valueColor: AlwaysStoppedAnimation<Color>(
            _flavor.currentFlavor.appColors!.primaryColor!,
          ),
        ),
      ),
    );
  }
}
