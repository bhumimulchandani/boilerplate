import 'dart:developer';

class LogUtils {
  static void logInfo(String message) {
    log(message, level: 0); 
  }

  static void logError(String message) {
    log(message, level: 1000); 
  }

  static void logDebug(String message) {
    log(message, level: 900); 
  }
}
