import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

void setupLogging() {
  Logger.root.level = kReleaseMode ? Level.INFO : Level.ALL;

  Logger.root.onRecord.listen((record) {
    developer.log(
      record.message,
      time: record.time,
      level: record.level.value,
      name: record.loggerName,
      error: record.error,
      stackTrace: record.stackTrace,
    );
  });
}
