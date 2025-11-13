import 'package:flutter/material.dart';
import 'package:movies_app/common/app_themes.dart';
import 'package:movies_app/router/router_config.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Movie App',
      theme: AppThemes(isDarkMode: true).theme,
      routerConfig: AppRouter.router,
    );
  }
}
