import 'dart:math';

import 'package:flutter/material.dart';

class CategoryColor {
  const CategoryColor(this.name, this.value);

  final String name;
  final int value;

  String get hex => colorHex(value);
}

String colorHex(int value) =>
    '#${(value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';

const categoryPalette = [
  CategoryColor('Mint', 0xFF4A9E85),
  CategoryColor('Forest', 0xFF1B6B5A),
  CategoryColor('Sage', 0xFF7CC4B0),
  CategoryColor('Amber', 0xFFC47D0E),
  CategoryColor('Indigo', 0xFF4A5BA8),
  CategoryColor('Terracotta', 0xFFB5523B),
  CategoryColor('Violet', 0xFF7A5BA8),
  CategoryColor('Slate', 0xFF8A8F8C),
];

int randomCategoryColor(Random random) =>
    0xFF000000 | random.nextInt(0x1000000);

Color categoryColorOf(int value) => Color(value);
