import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../base_configs/configs/flavor_config.dart';

class AppButton extends BaseStatelessWidget {
  const AppButton({
    Key? key,
    required this.flavor,
    required this.styles,
    required this.title,
    this.horizontalPadding,
    this.verticalPadding,
    this.onTap,
    this.buttonColor,
    this.widget,
  }) : super(key: key);

  final String title;
  final BaseFlavorConfig flavor;
  final StyleController styles;
  final double? horizontalPadding;
  final double? verticalPadding;

  final VoidCallback? onTap;
  final Color? buttonColor;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 4.r,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.r)),
        ),
        shadowColor:
            (buttonColor != null) ? buttonColor!.withOpacity(0.7) : flavor.appColors!.primaryColor!.withOpacity(0.7),
        backgroundColor: buttonColor ?? flavor.appColors!.primaryColor,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 16.w,
          vertical: verticalPadding ?? 12.h,
        ),
      ),
      onPressed: onTap ?? () {},
      child: widget ??
          Text(
            title,
            style: (buttonColor != null) ? styles.buttonTextStyleDark : styles.buttonTextStyle,
          ),
    );
  }
}
