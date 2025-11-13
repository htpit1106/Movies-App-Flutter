

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_app/common/app_colors.dart';
import 'package:movies_app/common/app_text_style.dart';

class AppThemes {
  static const _font = 'app.dart';
  bool isDarkMode;

  AppThemes({required this.isDarkMode});

  // TextTheme get texTheme{
  //   return TextTheme(
  //     final textColor = isDarkMode ? Colors.white : Colors.black;
  //
  //   );
  // }

  ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: AppBarTheme(
        color: AppColors.navbarColor,
        titleTextStyle: isDarkMode? AppTextStyle.titleMediumDark: AppTextStyle.titleMedium,
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black
        ),
      ),
      dividerTheme: DividerThemeData(
        color:AppColors.dividerColor
      )

    );
  }
}