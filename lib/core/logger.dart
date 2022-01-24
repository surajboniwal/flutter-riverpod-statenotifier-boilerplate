import 'dart:developer';

class Logger {
  static void info(String message, [String? title]) {
    log('\u001b[37m${message}', name: title ?? 'Info');
  }

  static void error(String message, [String? title]) {
    log('\u001b[31m${message}', name: title ?? 'Error');
  }
}
