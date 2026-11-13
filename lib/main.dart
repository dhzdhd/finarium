import 'package:finarium/src/app.dart';
import 'package:finarium/src/settings/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:finarium/src/rust/frb_generated.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(ProviderScope(child: _EagerInitialization(child: FinariumApp())));
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(settingsControllerProvider);
    return child;
  }
}
