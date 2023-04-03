import 'package:cmsocpp/app/data/models/navigation/navigation_model.dart';
import 'package:cmsocpp/app/presentation/screens/OTP/otp_screen.dart';
import 'package:cmsocpp/app/presentation/screens/OTP/otp_screen_binding.dart';
import 'package:cmsocpp/app/presentation/screens/change_password/change_password_screen.dart';
import 'package:cmsocpp/app/presentation/screens/change_password/change_password_screen_binding.dart';
import 'package:cmsocpp/app/presentation/screens/charge_by/charge_by_screen.dart';
import 'package:cmsocpp/app/presentation/screens/charge_by/charge_by_screen_binding.dart';
import 'package:cmsocpp/app/presentation/screens/charger_summary/charging_summary_binding.dart';
import 'package:cmsocpp/app/presentation/screens/charger_summary/charging_summary_screen.dart';
import 'package:cmsocpp/app/presentation/screens/charging_details/charging_details_screen.dart';
import 'package:cmsocpp/app/presentation/screens/charging_details/charging_details_screen_binding.dart';
import 'package:cmsocpp/app/presentation/screens/forgot_password/forgot_password_screen.dart';
import 'package:cmsocpp/app/presentation/screens/history/history_binding.dart';
import 'package:cmsocpp/app/presentation/screens/history/history_detail_screen.dart';
import 'package:cmsocpp/app/presentation/screens/history/history_screen.dart';
import 'package:cmsocpp/app/presentation/screens/home/home_screen.dart';
import 'package:cmsocpp/app/presentation/screens/home/home_screen_bindings.dart';
import 'package:cmsocpp/app/presentation/screens/login/login_screen.dart';
import 'package:cmsocpp/app/presentation/screens/login/login_screen_binding.dart';
import 'package:cmsocpp/app/presentation/screens/map/map_binding.dart';
import 'package:cmsocpp/app/presentation/screens/map/map_screen.dart';
import 'package:cmsocpp/app/presentation/screens/payment/payment_binding.dart';
import 'package:cmsocpp/app/presentation/screens/payment/payment_history.dart';
import 'package:cmsocpp/app/presentation/screens/payment/payment_screen.dart';
import 'package:cmsocpp/app/presentation/screens/payment/payment_summary.dart';
import 'package:cmsocpp/app/presentation/screens/profile/edit_profile_image_screen.dart';
import 'package:cmsocpp/app/presentation/screens/profile/profile.dart';
import 'package:cmsocpp/app/presentation/screens/profile/profile_binding.dart';
import 'package:cmsocpp/app/presentation/screens/qr_scanner/qr_scanner_screen.dart';
import 'package:cmsocpp/app/presentation/screens/qr_scanner/qr_scanner_screen_binding.dart';
import 'package:cmsocpp/app/presentation/screens/register/register_screen.dart';
import 'package:cmsocpp/app/presentation/screens/register/register_screen_binding.dart';
import 'package:cmsocpp/app/presentation/screens/reset_password/reset_password_screen.dart';
import 'package:cmsocpp/app/presentation/screens/reset_password/reset_password_screen_binding.dart';
import 'package:cmsocpp/app/presentation/screens/settings/settings_binding.dart';
import 'package:cmsocpp/app/presentation/screens/settings/settings_screen.dart';
import 'package:cmsocpp/app/presentation/screens/splash/spalsh_screen.dart';
import 'package:cmsocpp/app/presentation/screens/splash/spalsh_screen_binding.dart';
import 'package:cmsocpp/base_configs/configs/string_config.dart';

abstract class NavigationConfig {
  NavigationConfig._();

  static NavigationModel get initialRoute => splash;

  static final NavigationModel home = NavigationModel(
    route: StringConfig.homeRoute,
    screen: const HomeScreen(),
    bindings: HomeScreenBindings(),
  );

  static final NavigationModel splash = NavigationModel(
    route: StringConfig.splashScreenRoute,
    screen: const SplashScreen(),
    bindings: SplashScreenBinding(),
  );

  static final NavigationModel login = NavigationModel(
    route: StringConfig.loginScreenRoute,
    screen: const LoginScreen(),
    bindings: LoginScreenBinding(),
  );

  static final NavigationModel resetPassword = NavigationModel(
    route: StringConfig.resetPasswordRoute,
    screen: const ResetPasswordScreen(),
    bindings: ResetPasswordScreenBinding(),
  );

  static final NavigationModel forgotPassword = NavigationModel(
    route: StringConfig.forgotPasswordRoute,
    screen: const ForgotPasswordScreen(),
    bindings: ResetPasswordScreenBinding(),
  );

  static final NavigationModel register = NavigationModel(
    route: StringConfig.registerScreenRoute,
    screen: const RegisterScreen(),
    bindings: RegisterScreenBinding(),
  );

  static final NavigationModel otp = NavigationModel(
    route: StringConfig.otpScreenRoute,
    screen: const OTPScreen(),
    bindings: OTPScreeBinding(),
  );

  static final NavigationModel qrScanner = NavigationModel(
    route: StringConfig.qrScannerScreenRoute,
    screen: const QrScannerScreen(),
    bindings: QrScannerScreenBinding(),
  );

  static final NavigationModel chargingDetails = NavigationModel(
    route: StringConfig.chargingDetailsScreenRoute,
    screen: const ChargingDetailsScreen(),
    bindings: ChargingDetailsScreenBinding(),
  );

  static final NavigationModel chargeBy = NavigationModel(
    route: StringConfig.chargeByScreenRoute,
    screen: const ChargeByScreen(),
    bindings: ChargeByScreenBinding(),
  );

  static final NavigationModel settings = NavigationModel(
    route: StringConfig.settingsScreenRoute,
    screen: const SettingsScreen(),
    bindings: SettingsBinding(),
  );

  static final NavigationModel map = NavigationModel(
    route: StringConfig.mapScreenRoute,
    screen: const MapScreen(),
    bindings: MapBinding(),
  );

  static final NavigationModel history = NavigationModel(
    route: StringConfig.historyScreenRoute,
    screen: const HistoryScreen(),
    bindings: HistoryBinding(),
  );

  static final NavigationModel payment = NavigationModel(
    route: StringConfig.paymentScreenRoute,
    screen: const PaymentScreen(),
    bindings: PaymentBinding(),
  );

  static final NavigationModel paymentHistory = NavigationModel(
    route: StringConfig.paymentHistoryScreenRoute,
    screen: const PaymentHistoryScreen(),
    bindings: PaymentBinding(),
  );

  static final NavigationModel paymentSummary = NavigationModel(
    route: StringConfig.paymentSummaryScreenRoute,
    screen: const PaymentSummaryScreen(),
    bindings: PaymentBinding(),
  );

  static final NavigationModel profile = NavigationModel(
    route: StringConfig.profileScreenRoute,
    screen: const ProfileScreen(),
    bindings: ProfileBinding(),
  );

  static final NavigationModel editProfileImage = NavigationModel(
    route: StringConfig.editProfileImageScreenRoute,
    screen: const EditProfileImageScreen(),
    bindings: ProfileBinding(),
  );

  static final NavigationModel chargerSummary = NavigationModel(
    route: StringConfig.chargerSummaryScreenRoute,
    screen: const ChargingSummaryScreen(),
    bindings: ChargingSummaryBinding(),
  );

  static final NavigationModel changePassword = NavigationModel(
    route: StringConfig.changePasswordScreenRoute,
    screen: const ChangePasswordScreen(),
    bindings: ChangePasswordScreenBinding(),
  );

  static final NavigationModel historyDetail = NavigationModel(
    route: StringConfig.historyDetailScreenRoute,
    screen: const HistoryDetailScreen(),
    bindings: HistoryBinding(),
  );

  static final List<NavigationModel> availableNavigation = [
    home,
    splash,
    login,
    home,
    resetPassword,
    forgotPassword,
    register,
    otp,
    qrScanner,
    chargingDetails,
    chargeBy,
    map,
    history,
    payment,
    settings,
    profile,
    chargerSummary,
    changePassword,
    historyDetail,
  ];
}
