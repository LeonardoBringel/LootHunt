import 'package:flutter/material.dart';

ThemeData lootHuntTheme() {
  const eerieBlack = Color(0xFF1B1A17);
  const mustard = Color(0xFFFFC858);
  const rajah = Color(0xFFFFBA58);
  const black = Color(0x8A000000);

  ColorScheme colorScheme = const ColorScheme.dark().copyWith(
    primary: mustard,
    secondary: rajah,
    background: eerieBlack,
    tertiary: black,
  );

  TextTheme textTheme = const TextTheme(
    headline4: TextStyle(
      fontSize: 34,
      color: rajah,
    ),
    subtitle1: TextStyle(
      fontSize: 24,
      color: mustard,
      fontWeight: FontWeight.bold,
    ),
    subtitle2: TextStyle(
      fontSize: 24,
      color: mustard,
    ),
    bodyText1: TextStyle(
      fontSize: 18,
      color: mustard,
    ),
    bodyText2: TextStyle(
      fontSize: 16,
      color: mustard,
      fontStyle: FontStyle.italic,
    ),
  );

  return ThemeData(
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colorScheme.background,
    fontFamily: 'Bebas Neue',
    textTheme: textTheme,
  );
}
