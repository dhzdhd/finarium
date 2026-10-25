import 'package:finarium/src/settings/controllers/theme_controller.dart';
import 'package:finarium/src/settings/enums/auto_lock_duration.dart';
import 'package:finarium/src/settings/enums/budget_alert_threshold.dart';
import 'package:finarium/src/settings/widgets/backup_passphrase_dialog.dart';
import 'package:finarium/src/settings/widgets/settings_section.dart';
import 'package:finarium/src/settings/widgets/settings_switch_tile.dart';
import 'package:finarium/src/settings/widgets/settings_value_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  ConsumerState<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  var _autofill = true;
  var _biometrics = true;
  var _captureAlerts = true;
  var _autoLock = AutoLockDuration.oneMinute;
  var _budgetThreshold = BudgetAlertThreshold.eighty;

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);

    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        SettingsSection(
          title: 'Appearance',
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.palette_outlined),
              title: const Text('Theme'),
              trailing: DropdownButton<ThemeMode>(
                value: themeMode,
                isDense: true,
                underline: const SizedBox.shrink(),
                borderRadius: BorderRadius.circular(12),
                padding: const EdgeInsets.symmetric(vertical: 8),
                selectedItemBuilder: (context) => [
                  for (final mode in ThemeMode.values)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(_themeModeToString(mode)),
                    ),
                ],
                onChanged: (mode) {
                  if (mode != null) {
                    ref.read(themeModeProvider.notifier).setThemeMode(mode);
                  }
                },
                items: [
                  for (final mode in ThemeMode.values)
                    DropdownMenuItem(
                      value: mode,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(_themeModeIcon(mode), size: 20),
                          const SizedBox(width: 12),
                          Text(_themeModeToString(mode)),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        SettingsSection(
          title: 'Autofill and security',
          children: [
            SettingsSwitchTile(
              title: 'Autofill in apps and browsers',
              subtitle: 'Fills card credentials on approval',
              value: _autofill,
              onChanged: (value) => setState(() => _autofill = value),
            ),
            SettingsSwitchTile(
              title: 'Ask for biometrics every time',
              subtitle: 'Asks for fingerprint/face unlock before each autofill',
              value: _biometrics,
              onChanged: (value) => setState(() => _biometrics = value),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              title: const Text('Auto-lock vault'),
              subtitle: const Text('Locks when idle or in the background'),
              trailing: DropdownButton<AutoLockDuration>(
                value: _autoLock,
                isDense: true,
                underline: const SizedBox.shrink(),
                borderRadius: BorderRadius.circular(12),
                padding: const EdgeInsets.symmetric(vertical: 8),
                selectedItemBuilder: (context) => [
                  for (final duration in AutoLockDuration.values)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(duration.label),
                    ),
                ],
                onChanged: (value) {
                  if (value != null) setState(() => _autoLock = value);
                },
                items: [
                  for (final duration in AutoLockDuration.values)
                    DropdownMenuItem(
                      value: duration,
                      child: Text(duration.label),
                    ),
                ],
              ),
            ),
          ],
        ),
        SettingsSection(
          title: 'Automatic capture',
          children: [
            SettingsSwitchTile(
              title: 'Read bank SMS and notifications',
              subtitle: 'Detects transaction alerts from mobile notifications',
              value: _captureAlerts,
              onChanged: (value) => setState(() => _captureAlerts = value),
            ),
            const SettingsValueTile(
              title: 'Gmail statements',
              subtitle: 'Reads statements for limits and due dates',
            ),
          ],
        ),
        SettingsSection(
          title: 'Alerts and backup',
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              title: const Text('Budget alerts'),
              subtitle: const Text(
                'Notify me when my spends cross a certain percentage of budget',
              ),
              trailing: DropdownButton<BudgetAlertThreshold>(
                value: _budgetThreshold,
                isDense: true,
                underline: const SizedBox.shrink(),
                borderRadius: BorderRadius.circular(12),
                padding: const EdgeInsets.symmetric(vertical: 8),
                selectedItemBuilder: (context) => [
                  for (final threshold in BudgetAlertThreshold.values)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(threshold.label),
                    ),
                ],
                onChanged: (value) {
                  if (value != null) setState(() => _budgetThreshold = value);
                },
                items: [
                  for (final threshold in BudgetAlertThreshold.values)
                    DropdownMenuItem(
                      value: threshold,
                      child: Text(threshold.label),
                    ),
                ],
              ),
            ),
            SettingsValueTile(
              title: 'Encrypted backup',
              subtitle: 'Export your data with a passphrase',
              onTap: _showBackupDialog,
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _showBackupDialog() {
    return showDialog<void>(
      context: context,
      builder: (context) => const BackupPassphraseDialog(),
    );
  }

  String _themeModeToString(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.light => 'Light',
      ThemeMode.dark => 'Dark',
      ThemeMode.system => 'System',
    };
  }

  IconData _themeModeIcon(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.light => Icons.light_mode,
      ThemeMode.dark => Icons.dark_mode,
      ThemeMode.system => Icons.settings_system_daydream,
    };
  }
}
