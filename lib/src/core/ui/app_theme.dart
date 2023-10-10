import 'package:flutter/material.dart';

import 'constants.dart';

sealed class AppTheme {
  static ThemeData themeData = ThemeData(
    fontFamily: FontsConstants.bodyFontFamily,
    colorScheme: ColorScheme.fromSeed(seedColor: ColorsConstants.primary),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: ColorsConstants.primary),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorsConstants.primary,
        backgroundColor: ColorsConstants.secondary,
        minimumSize: const Size.fromHeight(70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: FontsConstants.textMedium.copyWith(
          fontSize: 32,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ColorsConstants.secondary,
        minimumSize: const Size.fromHeight(70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        side: const BorderSide(
          width: 2,
          color: ColorsConstants.secondary,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: FontsConstants.textRegular.copyWith(
          fontSize: 24,
        ),
      ),
    ),
  );
}
