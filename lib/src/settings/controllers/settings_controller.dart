import 'dart:async';

import 'package:finarium/src/core/database_provider.dart';
import 'package:finarium/src/settings/daos/settings_dao.dart';
import 'package:finarium/src/settings/enums/auto_lock_duration.dart';
import 'package:finarium/src/settings/enums/budget_alert_threshold.dart';
import 'package:finarium/src/settings/models/settings.dart';
import 'package:flutter/material.dart' show ThemeMode;
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_controller.g.dart';

final _log = Logger('SettingsController');

@Riverpod(keepAlive: true)
SettingsDao settingsDao(Ref ref) => ref.watch(appDatabaseProvider).settingsDao;

@Riverpod(keepAlive: true)
class SettingsController extends _$SettingsController {
  @override
  Future<Settings> build() async {
    final stored = await ref.watch(settingsDaoProvider).load();
    return stored ?? const Settings();
  }

  void setThemeMode(ThemeMode mode) {
    _update(state.value?.copyWith(themeMode: mode));
  }

  void setAutofill(bool value) {
    _update(state.value?.copyWith(autofill: value));
  }

  void setBiometrics(bool value) {
    _update(state.value?.copyWith(biometrics: value));
  }

  void setCaptureAlerts(bool value) {
    _update(state.value?.copyWith(captureAlerts: value));
  }

  void setGmailStatements(bool value) {
    _update(state.value?.copyWith(gmailStatements: value));
  }

  void setAutoLock(AutoLockDuration value) {
    _update(state.value?.copyWith(autoLock: value));
  }

  void setBudgetThreshold(BudgetAlertThreshold value) {
    _update(state.value?.copyWith(budgetThreshold: value));
  }

  void _update(Settings? next) {
    if (next == null) return;

    state = AsyncData(next);
    unawaited(_persist(next));
  }

  Future<void> _persist(Settings settings) async {
    try {
      await ref.read(settingsDaoProvider).save(settings);
    } catch (error, stackTrace) {
      _log.severe('Could not save settings', error, stackTrace);
    }
  }
}
