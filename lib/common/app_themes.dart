

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_app/common/app_colors.dart';
import 'package:movies_app/common/app_text_style.dart';

class AppThemes {



  ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: AppBarTheme(
        color: AppColors.navbarColor,
        titleTextStyle: AppTextStyle.titleMedium,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      dividerTheme: DividerThemeData(
        color:AppColors.dividerColor
      ),


    );
  }
}