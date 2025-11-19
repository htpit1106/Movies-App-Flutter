import 'package:go_router/go_router.dart';
import 'package:movies_app/ui/page/home/home_page.dart';
import 'package:movies_app/ui/page/movies_detail/movies_detail_page.dart';

class AppRouter {
  AppRouter._();

  // main page
  static const String splash = "/";
  static const String moviesDetail = "movies_detail";

  static final GoRouter router = GoRouter(routes: _routes);
  static final _routes = [
    GoRoute(
      path: splash,
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: moviesDetail,
          name: moviesDetail,
          builder: (context, state) => MoviesDetailPage(),
        ),
      ],
    ),
  ];
}
