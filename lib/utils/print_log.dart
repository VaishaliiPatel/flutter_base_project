import 'dart:core';

import 'package:flutter/foundation.dart';

bool shouldPrintLog = true;

printLog(value) {
  if (shouldPrintLog) {
    if (kDebugMode) {
      print("$value");
    }
  }
}

