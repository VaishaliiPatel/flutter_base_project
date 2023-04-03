abstract class AssetsConfig {
  AssetsConfig._();

  static const String _base = 'assets/';
  static const String _imageBase = 'assets/images/';
  static const String _iconBase = 'assets/icons/';

  static const String translations = '${_base}translations/';

  // Charger connector image base  url
  static const String connectorImageBaseUrl = 'http://smackpower.com/storage/images/connectors/';

  // Splash Screen
  static const String splashScreenBg = "${_imageBase}splash_screen.png";
  static const String appIcon = "${_iconBase}cms_logo.svg";

  // Charging Detail Screen
  static const String energyIcon = "${_iconBase}energy.svg";
  static const String timeIcon = "${_iconBase}time.svg";
  static const String powerIcon = "${_iconBase}power.svg";
  static const String flashIcon = "${_iconBase}flash.svg";
  static const String currencyIcon = "${_iconBase}currency.svg";

  // Map Screen
  static const String markerIconGreen = '${_iconBase}markerIconGreen.png';
  static const String markerIconRed = '${_iconBase}markerIconRed.png';
  static const String markerIconBlue = '${_iconBase}markerIconBlue.png';
  static const String markerIconGrey = '${_iconBase}markerIconGrey.png';
  static const String markerIconOrange = '${_iconBase}markerIconOrange.png';
  static const String markerIconYellow = '${_iconBase}markerIconYellow.png';
  static const String rightArrowIcon = '${_iconBase}right_arrow.svg';

  // Profile Screen
  static const String profileIcon = '${_imageBase}user.jpeg';

  // Charging Profile
  static const String chargingSummary = '${_imageBase}chargerSummary.svg';

  // Payment screen
  static const String razorpayImage = "${_imageBase}razorpay.png";
  static const String walletIcon = "${_iconBase}paymentSummary.png";
}
