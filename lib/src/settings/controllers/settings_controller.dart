import 'package:finarium/src/settings/enums/auto_lock_duration.dart';
import 'package:finarium/src/settings/enums/budget_alert_threshold.dart';
import 'package:finarium/src/settings/models/settings.dart';
import 'package:flutter/material.dart' show ThemeMode;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_controller.g.dart';

@Riverpod(keepAlive: true)
class SettingsController extends _$SettingsController {
  @override
  Settings build() => const Settings();

  void setThemeMode(ThemeMode mode) {
    state = state.copyWith(themeMode: mode);
  }

  void setAutofill(bool value) {
    state = state.copyWith(autofill: value);
  }

  void setBiometrics(bool value) {
    state = state.copyWith(biometrics: value);
  }

  void setCaptureAlerts(bool value) {
    state = state.copyWith(captureAlerts: value);
  }

  void setGmailStatements(bool value) {
    state = state.copyWith(gmailStatements: value);
  }

  void setAutoLock(AutoLockDuration value) {
    state = state.copyWith(autoLock: value);
  }

  void setBudgetThreshold(BudgetAlertThreshold value) {
    state = state.copyWith(budgetThreshold: value);
  }
}
