import 'package:finarium/src/settings/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(
      settingsControllerProvider.select((settings) => settings.themeMode),
    );

    return PopupMenuButton<ThemeMode>(
      initialValue: themeMode,
      onSelected: ref
          .read(settingsControllerProvider.notifier)
          .setThemeMode,
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: ThemeMode.light,
          child: Row(
            children: [
              Icon(Icons.light_mode),
              SizedBox(width: 8),
              Text('Light'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: ThemeMode.dark,
          child: Row(
            children: [
              Icon(Icons.dark_mode),
              SizedBox(width: 8),
              Text('Dark'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: ThemeMode.system,
          child: Row(
            children: [
              Icon(Icons.settings_system_daydream),
              SizedBox(width: 8),
              Text('System'),
            ],
          ),
        ),
      ],
      child: Icon(
        themeMode == ThemeMode.dark
            ? Icons.dark_mode
            : themeMode == ThemeMode.light
            ? Icons.light_mode
            : Icons.settings_system_daydream,
      ),
    );
  }
}
