import 'package:flutter/material.dart';
import 'package:movies_app/configs/app_config.dart';
import 'package:movies_app/common/app_themes.dart';
import 'package:movies_app/router/router_config.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConfigs.appName,
      theme: AppThemes().theme,
      routerConfig: AppRouter.router,
    );
  }
}
