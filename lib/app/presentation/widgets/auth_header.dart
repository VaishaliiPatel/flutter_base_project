import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AuthHeaderWidget extends StatelessWidget {
  final String title;
  final StyleController styles;

  const AuthHeaderWidget({required this.title, required this.styles, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.h,
        ),

        /// App Icon
        Align(
          alignment: Alignment.topCenter,
          child: SvgPicture.asset(
            AssetsConfig.appIcon,
            width: 0.55.sw,
          ),
        ),
        SizedBox(
          height: 40.h,
        ),

        /// Create account text
        Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: styles.screenTagTextStyle,
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
      ],
    );
  }
}
