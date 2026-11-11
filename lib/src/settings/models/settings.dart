import 'package:finarium/src/settings/enums/auto_lock_duration.dart';
import 'package:finarium/src/settings/enums/budget_alert_threshold.dart';
import 'package:flutter/material.dart' show ThemeMode;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
abstract class Settings with _$Settings {
  const factory Settings({
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default(true) bool autofill,
    @Default(true) bool biometrics,
    @Default(true) bool captureAlerts,
    @Default(false) bool gmailStatements,
    @Default(AutoLockDuration.oneMinute) AutoLockDuration autoLock,
    @Default(BudgetAlertThreshold.eighty) BudgetAlertThreshold budgetThreshold,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}
