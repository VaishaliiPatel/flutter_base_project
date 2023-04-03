import 'package:cmsocpp/app/presentation/widgets/common_button.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:cmsocpp/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CloseAppConfirmation extends BaseStatelessWidget {
  const CloseAppConfirmation({required this.flavor, required this.styles, Key? key}) : super(key: key);
  final BaseFlavorConfig flavor;

  final StyleController styles;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///  Header row
            Row(
              children: [
                /// Header widget
                Expanded(
                  child: Text(
                    StringConfig.exitAppConfirmationText,
                    style: styles.titleStyle,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 25.h,
            ),

            Row(
              children: [
                ///  Camera button
                Expanded(
                  child: AppButton(
                    flavor: flavor,
                    styles: styles,
                    title: StringConfig.exitText,
                    onTap: CommonMethods.onBackPress,
                    horizontalPadding: 10.w,
                    verticalPadding: 10.h,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),

                ///  Gallery button
                Expanded(
                  child: AppButton(
                    flavor: flavor,
                    styles: styles,
                    title: StringConfig.cancelText,
                    onTap: CommonMethods.onCancel,
                    horizontalPadding: 10.r,
                    verticalPadding: 10.h,
                    buttonColor: flavor.appColors!.backIconColor,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
