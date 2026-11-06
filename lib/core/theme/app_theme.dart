import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.page,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.action,
      surface: AppColors.surface,
      onSurface: AppColors.content,
      error: Color(0xFFDC4C4C),
    ),
    fontFamily: 'Noto Serif',
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        color: AppColors.content,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 1.25,
      ),
      titleLarge: TextStyle(
        color: AppColors.content,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 1.4,
      ),
      titleMedium: TextStyle(
        color: AppColors.content,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.45,
      ),
      bodyLarge: TextStyle(
        color: AppColors.content,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        color: AppColors.secondaryText,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.4,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.surface,
        minimumSize: const Size(52, 52),
        shape: const CircleBorder(),
        elevation: 3,
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: AppColors.border),
      ),
    ),
  );
}
