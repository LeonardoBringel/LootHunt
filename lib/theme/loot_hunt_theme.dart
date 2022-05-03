import 'package:flutter/material.dart';

ThemeData lootHuntTheme() {
  const eerieBlack = Color(0xFF1B1A17);
  const mustard = Color(0xFFFFC858);
  const rajah = Color(0xFFFFBA58);

  ColorScheme colorScheme = const ColorScheme.dark().copyWith(
    primary: mustard,
    secondary: rajah,
    background: eerieBlack,
  );

  return ThemeData(
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colorScheme.background,
  );
}
