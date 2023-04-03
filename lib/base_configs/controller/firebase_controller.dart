import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

import '../../core/base/base_controller.dart';
import '../repository/firebase_repository.dart';


class FirebaseController extends ServiceController {
  final BaseFirebaseRepository _repository;

  FirebaseController({required BaseFirebaseRepository repository}) : _repository = repository;

  Future<void> log({required String name, Map<String, Object?>? parameters}) =>
      _repository.log(name: name, parameters: parameters);

  Future<void> recordError(dynamic e, StackTrace? s) => _repository.recordError(e, s);

  Future<void> recordFlutterError(FlutterErrorDetails flutterErrorDetails, {bool fatal = false}) =>
      _repository.recordFlutterError(flutterErrorDetails, fatal: fatal);

  FirebaseAnalyticsObserver get navigationObserver => _repository.navigationObserver;
}
