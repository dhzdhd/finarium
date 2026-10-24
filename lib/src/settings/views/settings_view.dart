import 'package:finarium/src/settings/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return ListView(
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
