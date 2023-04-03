import 'package:cmsocpp/app/presentation/screens/qr_scanner/qr_scanner_screen_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/common_appbar.dart';
import 'package:cmsocpp/app/presentation/widgets/common_button.dart';
import 'package:cmsocpp/app/presentation/widgets/progress_loader.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerScreen extends BaseStatelessWidget {
  const QrScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QrScannerScreenController controller = Get.put(QrScannerScreenController());
    return Stack(
      children: [
        Scaffold(
          backgroundColor: controller.flavor.appColors!.appBgColor,
          resizeToAvoidBottomInset: false,

          /// App Bar
          appBar: CommonAppBar(
            flavor: controller.flavor,
            styles: controller.styles,
            title: StringConfig.qrScanner,
            showBackIcon: false,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.r),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 16.h),

                  /// Scan QR text
                  Text(
                    StringConfig.scanTheQRCodeText,
                    style: controller.styles.subTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),

                  /// QR Scanner View
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Obx(
                      () {
                        return Stack(
                          alignment: controller.animatedValue!.value!,
                          children: [
                            /// Scanner camera view
                            AspectRatio(
                              aspectRatio: 1,
                              child: SizedBox(
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(38.r)),
                                  child: Obx(
                                    () => controller.isCameraPermissionGranted.value
                                        ? QRView(
                                            key: controller.qrKey,
                                            onQRViewCreated: controller.onQRViewCreated,
                                            overlay: QrScannerOverlayShape(
                                              borderColor: ColorConfig.primaryColor,
                                              borderRadius: 28.r,
                                              borderLength: 40.r,
                                              borderWidth: 12.r,
                                              cutOutSize: double.infinity,
                                            ),
                                            // onPermissionSet: (ctrl, p) => controller.onPermissionSet(context, ctrl, p),
                                          )
                                        : Container(
                                            color: controller.flavor.appColors!.tabBgColor,
                                            alignment: Alignment.center,
                                            child: GestureDetector(
                                              onTap: controller.checkCameraPermissionStatus,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: controller.flavor.appColors!.selectedTabColor,
                                                    borderRadius: BorderRadius.circular(6.r)),
                                                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                                                child: Text(
                                                  StringConfig.permission,
                                                  style: controller.styles.timerTextStyle,
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),

                            /// Scanner line
                              Visibility(
                              visible: controller.isCameraPermissionGranted.value,
                              child: Container(
                                height: 4.h,
                                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.r),
                                  color: ColorConfig.scannerLineColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorConfig.primaryColor,
                                      blurRadius: 8.r,
                                      offset: const Offset(0.0, 3.0),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),

                  /// OR Text
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.r),
                    child: Text(
                      StringConfig.or,
                      style: controller.styles.subTitleStyle,
                    ),
                  ),

                  /// Connect with charge id button
                  AppButton(
                    flavor: controller.flavor,
                    styles: controller.styles,
                    title: StringConfig.connectWithChargeId,
                    onTap: controller.getDialog,
                  ),
                ],
              ),
            ),
          ),
        ),

        /// Progress Loader
        Obx(
          () => controller.isLoading.value ? ProgressLoader() : const SizedBox(),
        ),
      ],
    );
  }
}
