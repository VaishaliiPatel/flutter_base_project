import 'package:flutter/foundation.dart';

abstract class AppConfig {
  AppConfig._();

  static const bool _isFirebaseEnabledForDebug = true;
  static const bool isFirebaseEnabled = _isFirebaseEnabledForDebug || kReleaseMode;

  static const String baseUrlBacancy = 'https://bacancy.smackpower.com/api/';
  static const String fontFamily = 'Poppins';
  static const int minDeviceHeight = 732;
}
