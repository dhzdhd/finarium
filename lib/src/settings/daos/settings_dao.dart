import 'package:drift/drift.dart';
import 'package:finarium/src/database.dart';
import 'package:finarium/src/settings/models/settings.dart';
import 'package:finarium/src/settings/tables/app_settings_table.dart';

part 'settings_dao.g.dart';

@DriftAccessor(tables: [AppSettings])
class SettingsDao extends DatabaseAccessor<AppDatabase> with _$SettingsDaoMixin {
  SettingsDao(super.db);

  Future<Settings?> load() async {
    final row = await select(appSettings).getSingleOrNull();
    return row == null ? null : _settingsFromRow(row);
  }

  Future<void> save(Settings settings) {
    return into(appSettings).insertOnConflictUpdate(
      _settingsCompanion(settings),
    );
  }
}

Settings _settingsFromRow(SettingsRow row) {
  return Settings(
    themeMode: row.themeMode,
    autofill: row.autofill,
    biometrics: row.biometrics,
    captureAlerts: row.captureAlerts,
    gmailStatements: row.gmailStatements,
    autoLock: row.autoLock,
    budgetThreshold: row.budgetThreshold,
  );
}

AppSettingsCompanion _settingsCompanion(Settings settings) {
  return AppSettingsCompanion(
    id: const Value(1),
    themeMode: Value(settings.themeMode),
    autofill: Value(settings.autofill),
    biometrics: Value(settings.biometrics),
    captureAlerts: Value(settings.captureAlerts),
    gmailStatements: Value(settings.gmailStatements),
    autoLock: Value(settings.autoLock),
    budgetThreshold: Value(settings.budgetThreshold),
  );
}
