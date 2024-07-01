import 'package:logger/logger.dart';

class AppLogger {
  static void debug({String? message}) {
    String logMessage = message ?? "";
    Logger().d("debug$logMessage");
  }

  static void error({String? message, StackTrace? errorStack, dynamic error}) {
    String logMessage = message ?? "";
    logMessage += error.toString();
    Logger().e("error$logMessage", error: error, stackTrace: errorStack);
  }
}
