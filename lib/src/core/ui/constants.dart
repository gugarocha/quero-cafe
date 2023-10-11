import 'package:flutter/material.dart';

sealed class ColorsConstants {
  static const primary = Color(0XFF3F2314);
  static const secondary = Color(0XFFF69800);
  static const background = Color(0xFFF2F2F2);
}

sealed class ImagesConstants {
  static const logo = 'assets/images/logo.png';
  static const homeImage = 'assets/images/home_image.png';
  static const backgroundImage = 'assets/images/background.png';
}

sealed class FontsConstants {
  static const bodyFontFamily = 'FiraSans';
  static const titleFontFamily = 'SortsMillGoudy';

  static const textLight = TextStyle(
    fontFamily: bodyFontFamily,
    fontWeight: FontWeight.w300,
  );
  static const textRegular = TextStyle(
    fontFamily: bodyFontFamily,
    fontWeight: FontWeight.w400,
  );
  static const textMedium = TextStyle(
    fontFamily: bodyFontFamily,
    fontWeight: FontWeight.w500,
  );
  static const textSemiBold = TextStyle(
    fontFamily: bodyFontFamily,
    fontWeight: FontWeight.w600,
  );
  static const textTitle = TextStyle(
    fontFamily: titleFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 42,
  );
}
