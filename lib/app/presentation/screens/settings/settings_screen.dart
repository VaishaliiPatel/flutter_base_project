import 'package:cmsocpp/app/presentation/screens/settings/settings_controller.dart';
import 'package:cmsocpp/app/presentation/widgets/common_appbar.dart';
import 'package:cmsocpp/app/presentation/widgets/progress_loader.dart';
import 'package:cmsocpp/base_configs/configs/string_config.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsScreen extends BaseStatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsScreenController());
    return Stack(
      children: [
        Scaffold(
          backgroundColor: controller.flavor.appColors!.appBgColor,
          appBar: CommonAppBar(
            flavor: controller.flavor,
            styles: controller.styles,
            title: StringConfig.settingsScreen,
            showBackIcon: false,
          ),
          body: Column(
            children: [
              buildDividerWidget(controller),

              /// Theme tile
              buildListTileWidget(
                controller: controller,
                title: StringConfig.themeText,
                onTap: null,
                leadingIcon: controller.isDarkTheme.value ? Icons.dark_mode : Icons.light_mode,
                trailingWidget: Switch(
                  value: controller.isDarkTheme.value,
                  onChanged: controller.changeAppTheme,
                  activeColor: controller.flavor.appColors!.primaryColor,
                ),
              ),
              buildDividerWidget(controller),

              /// Profile  tile
              buildListTileWidget(
                controller: controller,
                title: StringConfig.profileText,
                onTap: controller.onProfileClick,
                leadingIcon: Icons.account_circle_rounded,
              ),
              buildDividerWidget(controller),

              /// Change Password tile
              buildListTileWidget(
                controller: controller,
                title: StringConfig.changePassword,
                onTap: controller.onChangePassword,
                leadingIcon: Icons.password,
              ),
              buildDividerWidget(controller),

              /// Logout tile
              buildListTileWidget(
                controller: controller,
                title: StringConfig.logoutText,
                onTap: controller.getLogoutConfirmationDialog,
                leadingIcon: Icons.logout,
              ),
              buildDividerWidget(controller),

              /// Version tile
              ListTile(
                title: Text(
                  StringConfig.appVersionText,
                  style: controller.styles.mediumTextDark,
                ),
                trailing: Text(
                  StringConfig.appVersion,
                  style: controller.styles.mediumTextDark,
                ),
              ),
              buildDividerWidget(controller),
            ],
          ),
        ),

        /// Progress Loader
        Obx(
          () => controller.isLoading.value ? ProgressLoader() : const SizedBox(),
        ),
      ],
    );
  }

  /// Build Divider
  Widget buildDividerWidget(SettingsScreenController controller) {
    return Divider(
      thickness: 2.r,
      color: controller.flavor.appColors!.enabledBorderColor!,
    );
  }

  // Build common list tile field
  Widget buildListTileWidget({
    required SettingsScreenController controller,
    required VoidCallback? onTap,
    required String title,
    IconData? leadingIcon,
    Widget? trailingWidget,
  }) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Text(
          title,
          style: controller.styles.mediumTextDark,
        ),
        leading: leadingIcon != null
            ? Icon(
                leadingIcon,
                color: controller.flavor.appColors!.backIconColor,
              )
            : const SizedBox.shrink(),
        trailing: trailingWidget,
      ),
    );
  }
}
