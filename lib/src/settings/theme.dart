import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF1B6B5A),
    brightness: Brightness.light,
  ),
  cardTheme: const CardThemeData(
    elevation: 0,
    margin: EdgeInsets.zero,
  ),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF1B6B5A),
    brightness: Brightness.dark,
  ),
  cardTheme: const CardThemeData(
    elevation: 0,
    margin: EdgeInsets.zero,
  ),
);
