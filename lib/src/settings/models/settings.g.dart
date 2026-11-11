// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Settings _$SettingsFromJson(Map<String, dynamic> json) => _Settings(
  themeMode:
      $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
      ThemeMode.system,
  autofill: json['autofill'] as bool? ?? true,
  biometrics: json['biometrics'] as bool? ?? true,
  captureAlerts: json['captureAlerts'] as bool? ?? true,
  gmailStatements: json['gmailStatements'] as bool? ?? false,
  autoLock:
      $enumDecodeNullable(_$AutoLockDurationEnumMap, json['autoLock']) ??
      AutoLockDuration.oneMinute,
  budgetThreshold:
      $enumDecodeNullable(
        _$BudgetAlertThresholdEnumMap,
        json['budgetThreshold'],
      ) ??
      BudgetAlertThreshold.eighty,
);

Map<String, dynamic> _$SettingsToJson(_Settings instance) => <String, dynamic>{
  'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
  'autofill': instance.autofill,
  'biometrics': instance.biometrics,
  'captureAlerts': instance.captureAlerts,
  'gmailStatements': instance.gmailStatements,
  'autoLock': _$AutoLockDurationEnumMap[instance.autoLock]!,
  'budgetThreshold': _$BudgetAlertThresholdEnumMap[instance.budgetThreshold]!,
};

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

const _$AutoLockDurationEnumMap = {
  AutoLockDuration.immediately: 'immediately',
  AutoLockDuration.thirtySeconds: 'thirtySeconds',
  AutoLockDuration.oneMinute: 'oneMinute',
  AutoLockDuration.fiveMinutes: 'fiveMinutes',
  AutoLockDuration.fifteenMinutes: 'fifteenMinutes',
  AutoLockDuration.thirtyMinutes: 'thirtyMinutes',
  AutoLockDuration.oneHour: 'oneHour',
  AutoLockDuration.never: 'never',
};

const _$BudgetAlertThresholdEnumMap = {
  BudgetAlertThreshold.none: 'none',
  BudgetAlertThreshold.fifty: 'fifty',
  BudgetAlertThreshold.sixty: 'sixty',
  BudgetAlertThreshold.seventy: 'seventy',
  BudgetAlertThreshold.eighty: 'eighty',
  BudgetAlertThreshold.ninety: 'ninety',
  BudgetAlertThreshold.hundred: 'hundred',
};
