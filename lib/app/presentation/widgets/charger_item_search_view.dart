import 'package:cmsocpp/app/data/models/charge_point_location/charge_point_location.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChargerItemSearchView extends StatelessWidget {
  const ChargerItemSearchView({
    required this.chargerItem,
    required this.flavor,
    required this.styles,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  final BaseFlavorConfig flavor;

  final StyleController styles;

  final Datum chargerItem;

  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 10.h,
        ),
        padding: EdgeInsets.only(top: 15.r, bottom: 10.r, left: 12.r, right: 12.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: flavor.appColors!.lightGreyForDetailBg!.withOpacity(0.3),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Location marker

            Image.asset(
              CommonMethods.getIconByConnectorStatus(CommonMethods.getStatusFromApi(chargerItem.status), flavor)!,
              width: 15.w,
              height: 25.h,
            ),

            SizedBox(width: 12.w),

            /// List title

            Expanded(
              child: Text(
                chargerItem.locationName ?? '',
                style: styles.infoTextStyle,
              ),
            ),

            /// Distance field

            Container(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: flavor.appColors!.appBgColor,
              ),
              child: Text(
                chargerItem.zoneName ?? '',
                style: styles.mediumTextBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
