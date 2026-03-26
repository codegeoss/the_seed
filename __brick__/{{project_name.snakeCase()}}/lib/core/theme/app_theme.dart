import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:{{project_name.snakeCase()}}/core/core.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.primary.withValues(alpha: 0.1),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(AppColors.primary),
      trackColor: WidgetStateProperty.all(Colors.grey.shade200),
      thickness: WidgetStateProperty.all(6),
      radius: const Radius.circular(AppSizes.cardRadiusLg),
      minThumbLength: 50,
    ),
    useMaterial3: true,
    fontFamily: GoogleFonts.inter().fontFamily,
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
    colorScheme: const ColorScheme.light(),
  );

  static final ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade900,
      surfaceTintColor: AppColors.primary.withValues(alpha: 0.1),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(AppColors.primary),
      trackColor: WidgetStateProperty.all(Colors.grey.shade200),
      thickness: WidgetStateProperty.all(6),
      radius: const Radius.circular(AppSizes.cardRadiusLg),
      minThumbLength: 50,
    ),
    useMaterial3: true,
    fontFamily: GoogleFonts.inter().fontFamily,
    scaffoldBackgroundColor: Colors.black,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
    colorScheme: const ColorScheme.dark(),
  );
}
