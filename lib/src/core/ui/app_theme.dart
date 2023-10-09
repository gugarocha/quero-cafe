import 'package:flutter/material.dart';

import 'constants.dart';

sealed class AppTheme {
  static ThemeData themeData = ThemeData(
    fontFamily: FontsConstants.bodyFontFamily,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorsConstants.primary,
        backgroundColor: ColorsConstants.secondary,
        minimumSize: const Size.fromHeight(70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
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
  );
}
