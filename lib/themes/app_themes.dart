import 'package:flutter/material.dart';
import 'package:okiku/themes/app_color.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundCream,
    primaryColor: AppColor.primaryYellow,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColor.accentOlive,
      error: AppColor.accentBurntOrange,
    ),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: AppColor.textDark)),
    fontFamily: 'Poppins',

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        elevation: 2,
        minimumSize: Size(200, 50),
      ),
    ),
  );
}
