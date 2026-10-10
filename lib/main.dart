import 'package:finarium/src/app.dart';
import 'package:flutter/material.dart';
import 'package:finarium/src/rust/frb_generated.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(ProviderScope(child: FinariumApp()));
}
