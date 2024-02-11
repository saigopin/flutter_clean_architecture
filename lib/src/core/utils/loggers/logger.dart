import 'dart:developer' as developer;
import 'package:flutter/foundation.dart' as foundation;

class Logger {
 static void print({required String message}) {
    if (foundation.kDebugMode) {
      foundation.debugPrint(message);
    }
  }
 static void log({required String message}) {
    if (foundation.kDebugMode) {
      developer.log(message);
    }
  }
}
