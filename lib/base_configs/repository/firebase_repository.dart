import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import '../configs/app_config.dart';

abstract class BaseFirebaseRepository {
  Future<void> init();

  Future<void> log({required String name, Map<String, Object?>? parameters});

  Future<void> recordError(dynamic e, StackTrace? s);

  Future<void> recordFlutterError(FlutterErrorDetails flutterErrorDetails, {bool fatal = false});

  FirebaseAnalyticsObserver get navigationObserver;
}

class FirebaseRepository extends BaseFirebaseRepository {
  @override
  Future<void> init() async {
    try {
      if (AppConfig.isFirebaseEnabled) {
        await Firebase.initializeApp();
        FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      }
    } catch (_) {}
  }

  @override
  Future<void> log({required String name, Map<String, Object?>? parameters}) async {
    try {
      if (AppConfig.isFirebaseEnabled) {
        await FirebaseAnalytics.instance.logEvent(name: name, parameters: parameters);
      }
    } catch (_) {}
  }

  @override
  Future<void> recordError(dynamic e, StackTrace? s) async {
    try {
      if (AppConfig.isFirebaseEnabled) {
        await FirebaseCrashlytics.instance.recordError(e, s);
      }
    } catch (_) {}
  }

  @override
  Future<void> recordFlutterError(FlutterErrorDetails flutterErrorDetails, {bool fatal = false}) async {
    try {
      if (AppConfig.isFirebaseEnabled) {
        await FirebaseCrashlytics.instance.recordFlutterError(flutterErrorDetails, fatal: fatal);
      }
    } catch (_) {}
  }

  @override
  FirebaseAnalyticsObserver get navigationObserver => FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance);
}
