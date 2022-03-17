import 'dart:developer';

import 'package:intl/intl.dart';

enum LOG_LEVEL {
  debug,
  info,
  waring,
  error,
}

class Log {
  static DateFormat dateFormat = DateFormat('HH:mm:ss.sss');
  bool isShowLog = true;
  static String getTime() {
    return dateFormat.format(DateTime.now());
  }

  static d(msg) {
    msg = "${getTime()}:: $msg";
    log("\x1B[34m$msg\x1B[0m");
  }

  static i(msg) {
    msg = "${getTime()}:: $msg";
    log("\x1B[32m$msg\x1B[0m");
  }

  static w(msg) {
    msg = "${getTime()}:: $msg";
    log("\x1B[33m$msg\x1B[0m");
  }

  static e(msg) {
    msg = "${getTime()}:: $msg";
    log("\x1B[31m$msg\x1B[0m");
  }

  static api(msg) {
    msg = "${getTime()}::$msg";
    log("\x1B[35m$msg\x1B[0m");
  }

  static api2(msg) {
    msg = "${getTime()}:: $msg";
    log("\x1B[45m$msg\x1B[0m");
  }

  static dd(msg) {
    msg = "${getTime()}:: $msg";
    log("\x1B[44m$msg\x1B[0m");
  }

  static ii(msg) {
    msg = "${getTime()}:: $msg";
    log("\x1B[42m$msg\x1B[0m");
  }

  static ww(msg) {
    msg = "${getTime()}:: $msg";
    log("\x1B[43m$msg\x1B[0m");
  }

  static ee(msg) {
    msg = "${getTime()}:: $msg";
    log("\x1B[41m$msg\x1B[0m");
  }

  static largeLog(msg) {
    msg = "${getTime()}:: $msg";
  }

  static void logPrint(Object object) async {
    int defaultPrintLength = 1020;
    if (object.toString().length <= defaultPrintLength) {
      log(object.toString());
    } else {
      String tempLog = object.toString();
      int start = 0;
      int endIndex = defaultPrintLength;
      int logLength = tempLog.length;
      int tmpLogLength = tempLog.length;
      while (endIndex < logLength) {
        log(tempLog.substring(start, endIndex));
        endIndex += defaultPrintLength;
        start += defaultPrintLength;
        tmpLogLength -= defaultPrintLength;
      }
      if (tmpLogLength > 0) {
        log(tempLog.substring(start, logLength));
      }
    }
  }
}
