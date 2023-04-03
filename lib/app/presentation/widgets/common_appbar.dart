import 'package:cmsocpp/app/presentation/screens/history/history_controller.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BaseFlavorConfig flavor;
  final StyleController styles;
  final String title;
  final VoidCallback? onClick;
  final bool showBackIcon;
  final bool isShowRightIcon;
  final HistoryScreenController? controller;
  final Widget? suffix;
  final Widget? overlay;

  const CommonAppBar({
    Key? key,
    required this.flavor,
    required this.styles,
    required this.title,
    this.onClick,
    this.controller,
    this.suffix,
    this.showBackIcon = true,
    this.isShowRightIcon = false,
    this.overlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.r,
      child: Padding(
        padding: EdgeInsets.only(
          left: 12.r,
          right: 24.r,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (showBackIcon)
                  InkWell(
                    onTap: onClick,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(12.r, 8.r, 12.r, 8.r),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20.r,
                        color: flavor.appColors!.backIconColor,
                      ),
                    ),
                  ),
                if (!showBackIcon) SizedBox(width: 12.r),

                /// Screen Title
                Text(
                  title,
                  style: styles.titleStyle,
                ),
                const Spacer(),

                /// Search Bar
                if (isShowRightIcon) suffix!
              ],
            ),

            /// Search View
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: overlay ?? const SizedBox(),
            )
          ],
        ),
      ),
    );
  }

  DropdownMenuItem buildDropdownMenuItemWidget({
    required String title,
    IconData? icon,
    required bool isShowIcon,
  }) {
    return DropdownMenuItem(
      value: title,
      child: Row(
        children: [
          Text(
            title,
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
          ),
          if (isShowIcon)
            SizedBox(
              width: 5.w,
            ),
          if (isShowIcon)
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  icon,
                  size: 25.r,
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(64.r);
}
