import 'package:cmsocpp/app/presentation/screens/map/map_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/charger_item_view.dart';
import 'package:cmsocpp/app/presentation/widgets/icon_with_circle_bg.dart';
import 'package:cmsocpp/app/presentation/widgets/progress_loader.dart';
import 'package:cmsocpp/base_configs/configs/string_config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChargerLocationBottomSheet extends BaseStatelessWidget {
  const ChargerLocationBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapController());
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 12.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ///  Header widget
          Row(
            children: [
              Expanded(
                child: Text(
                  StringConfig.chargerLocation,
                  style: controller.styles.titleStyle,
                ),
              ),

              SizedBox(
                width: 10.w,
              ),

              /// Close  Icon
              IconWithCircleBg(
                flavor: controller.flavor,
                onClick: controller.onBack,
              ),
            ],
          ),
          SizedBox(
            height: 20.r,
          ),

          /// Location list tile
          controller.chargerLocationList.value.isNotEmpty
              ? Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.chargerLocationList.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ChargerItemView(
                        chargerItem: controller.chargerLocationList.value[index],
                        flavor: controller.flavor,
                        styles: controller.styles,
                        controller: controller,
                        onClick: () {
                          controller.onChargePointItemClick(controller.chargerLocationList.value[index]);
                        },
                      );
                    },
                  ),
                )
              : Text(
                  StringConfig.noChargersFound,
                  style: controller.styles.mediumTextBlack,
                ),

          /// load more loader view
          if (controller.isLoadMore.value)
            IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: ProgressLoader(),
              ),
            ),
        ],
      ),
    );
  }
}
