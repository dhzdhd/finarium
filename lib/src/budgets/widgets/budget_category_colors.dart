import 'package:flutter/material.dart';

const _palette = [
  Color(0xFF1B6B5A),
  Color(0xFF7CC4B0),
  Color(0xFFC47D0E),
  Color(0xFF4A5BA8),
  Color(0xFF8A8F8C),
];

Color budgetCategoryColor(int index) => _palette[index % _palette.length];
