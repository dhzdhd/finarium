import 'package:drift/drift.dart';
import 'package:finarium/src/settings/enums/auto_lock_duration.dart';
import 'package:finarium/src/settings/enums/budget_alert_threshold.dart';
import 'package:flutter/material.dart' show ThemeMode;

@DataClassName('SettingsRow')
class AppSettings extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  TextColumn get themeMode => textEnum<ThemeMode>()();
  BoolColumn get autofill => boolean()();
  BoolColumn get biometrics => boolean()();
  BoolColumn get captureAlerts => boolean()();
  BoolColumn get gmailStatements => boolean()();
  TextColumn get autoLock => textEnum<AutoLockDuration>()();
  TextColumn get budgetThreshold => textEnum<BudgetAlertThreshold>()();

  @override
  Set<Column> get primaryKey => {id};
}
