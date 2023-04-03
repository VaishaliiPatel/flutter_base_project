import 'package:cmsocpp/app/presentation/screens/history/history_detail_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/common_appbar.dart';
import 'package:cmsocpp/base_configs/configs/config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HistoryDetailScreen extends BaseStatelessWidget {
  const HistoryDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryDetailScreenController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: controller.flavor.appColors!.appBgColor,
        appBar: CommonAppBar(
          flavor: controller.flavor,
          styles: controller.styles,
          title: StringConfig.historyDetailScreen,
          onClick: controller.onBackPress,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.historyData.location!,
                  style: controller.styles.titleStyle,
                ),
                SizedBox(
                  height: 10.r,
                ),
                buildDetailWidget(
                  controller: controller,
                  title: StringConfig.transactionIdTitle,
                  value: '${controller.historyData.transactionId}',
                ),
                buildDetailWidget(
                  controller: controller,
                  title: StringConfig.dateText,
                  value: controller.historyData.startDate!,
                ),
                buildDetailWidget(
                  controller: controller,
                  title: StringConfig.addressText,
                  value: controller.historyData.locationAddress!,
                ),
                Divider(
                  color: controller.flavor.appColors!.lightGreyForDetailBg!,
                  thickness: 1.5.r,
                ),
                SizedBox(
                  height: 10.r,
                ),
                Text(
                  StringConfig.infoTitleText,
                  style: controller.styles.textFieldLabelStyle,
                ),
                SizedBox(
                  height: 10.r,
                ),
                buildInfoWidget(
                  controller: controller,
                  title: StringConfig.connectorID,
                  value: '${controller.historyData.connectorId}',
                ),
                SizedBox(
                  height: 10.r,
                ),
                buildInfoWidget(
                  controller: controller,
                  title: StringConfig.connectorType,
                  value: controller.historyData.connectorType!,
                ),
                SizedBox(
                  height: 10.r,
                ),
                buildInfoWidget(
                  controller: controller,
                  title: StringConfig.currentType,
                  value: controller.historyData.currentType!,
                ),
                SizedBox(
                  height: 10.r,
                ),
                buildInfoWidget(
                  controller: controller,
                  title: StringConfig.connectorImage,
                  isShowText: false,
                ),
                SizedBox(
                  height: 10.r,
                ),
                buildInfoWidget(
                  controller: controller,
                  title: StringConfig.stopReason,
                  value: controller.historyData.stopReason!,
                ),
                SizedBox(
                  height: 10.r,
                ),
                buildInfoWidget(
                  controller: controller,
                  title: StringConfig.energyConsume,
                  value: '${controller.historyData.energyConsume} ${StringConfig.chargingUnit}',
                ),
                SizedBox(
                  height: 10.r,
                ),
                buildInfoWidget(
                  controller: controller,
                  title: StringConfig.energyCharge,
                  value: '${StringConfig.rupees} ${controller.historyData.energyCharge}',
                ),
                SizedBox(
                  height: 10.r,
                ),
                buildInfoWidget(
                  controller: controller,
                  title: StringConfig.durationText,
                  value: controller.historyData.duration!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDetailWidget(
      {required HistoryDetailScreenController controller, required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: controller.styles.mediumTextLight,
        ),
        Text(
          value,
          style: controller.styles.mediumTextDark,
        ),
        SizedBox(
          height: 10.r,
        )
      ],
    );
  }

  Widget buildInfoWidget(
      {required HistoryDetailScreenController controller,
      required String title,
      String value = '',
      bool isShowText = true}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: controller.styles.mediumTextLight,
          ),
        ),
        Expanded(
          child: isShowText
              ? Text(
                  value,
                  style: controller.styles.mediumTextDark,
                )
              : Align(
                  alignment: Alignment.centerLeft,
                  child: Image.network(
                    controller.historyData.connectorImage!,
                    height: 25.r,
                    width: 25.r,
                  ),
                ),
        ),
      ],
    );
  }
}
