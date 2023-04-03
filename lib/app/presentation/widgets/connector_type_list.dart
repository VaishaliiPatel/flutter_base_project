import 'package:cmsocpp/app/data/models/charge_point_location/charge_point_location.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConnectorTypeList extends StatelessWidget {
  const ConnectorTypeList(
      {required this.title, required this.connectorList, required this.flavor, required this.styles, Key? key})
      : super(key: key);
  final String title;
  final BaseFlavorConfig flavor;
  final StyleController styles;
  final List<ConnectorsByType> connectorList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      /// Charge per unit
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: styles.mediumTextBlack,
          ),
          SizedBox(
            height: 5.h,
          ),

          /// For show charger connector type
          Container(
            alignment: Alignment.center,
            height: 25.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: connectorList.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int itemIndex) {
                return connectorList.isNotEmpty
                    ? Container(
                        padding: EdgeInsets.only(left: 10.r, right: 5.r, top: 5.r, bottom: 5.r),
                        margin: EdgeInsets.only(right: 5.r),
                        decoration: BoxDecoration(
                          color: flavor.appColors!.appBgColor,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Row(
                          children: [
                            Text(
                              connectorList[itemIndex].connectorType!,
                              textAlign: TextAlign.center,
                              style: styles.smallTextStyle?.copyWith(color: flavor.appColors?.titleColor),
                            ),
                            SizedBox(
                              width: 5.r,
                            ),
                            Image.network(
                              connectorList[itemIndex].connectorImage!,
                              height: 25.r,
                              width: 25.r,
                            )
                          ],
                        ),
                      )
                    : const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
