import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconWithCircleBg extends StatelessWidget {
  const IconWithCircleBg({required this.flavor, this.onClick, this.icon, Key? key}) : super(key: key);
  final BaseFlavorConfig flavor;
  final IconData? icon;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.all(1.r),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5.r,
            color: flavor.appColors!.backIconColor!,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Icon(
          icon ?? Icons.close_rounded,
          size: 16.r,
          color: flavor.appColors!.backIconColor,
        ),
      ),
    );
  }
}
