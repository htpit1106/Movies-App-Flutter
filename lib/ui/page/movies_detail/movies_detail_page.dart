import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/common/app_colors.dart';
import 'package:movies_app/common/app_icons.dart';
import 'package:movies_app/common/app_text_style.dart';
import 'package:movies_app/configs/app_config.dart';
import 'package:movies_app/model/entities/movie_entity.dart';
import 'package:movies_app/network/api_util.dart';
import 'package:movies_app/ui/widgets/icon_label.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../repository/movie_repository.dart';

class MoviesDetailPage extends StatefulWidget {
  const MoviesDetailPage({super.key});

  @override
  State<MoviesDetailPage> createState() => _MoviesDetailPageState();
}

class _MoviesDetailPageState extends State<MoviesDetailPage> {
  late int movieId;
  bool isLoaded = false;
  late MovieEntity movie;
  late final MovieRepository repository;
  bool isBookmarked = false;
  late final SharedPreferences prefs;
  late List<String> listMoviesBookmarked;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadMovieData();
    });
  }

  Future<void> _loadMovieData() async {
    final extraData = GoRouterState.of(context).extra;
    if (extraData != null && extraData is Map<String, dynamic>) {
      movieId = extraData['id'];
    }

    // shared_preferennces
    prefs = await SharedPreferences.getInstance();
    listMoviesBookmarked = prefs.getStringList('id') ?? [];
    isBookmarked = listMoviesBookmarked.contains(movieId.toString());

    repository = MovieRepositoryImpl(apiClient: ApiUtil.apiClient);
    movie = await repository.getDetailMovie(id: movieId);

    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      return Scaffold(
        appBar: AppBar(title: Text("Detail")),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () async {
                if (isBookmarked) {
                  listMoviesBookmarked.remove(movieId.toString());
                  await prefs.setStringList('id', listMoviesBookmarked);
                } else {
                  listMoviesBookmarked.add(movieId.toString());
                  await prefs.setStringList('id',  listMoviesBookmarked);
                }
                setState(() {
                  isBookmarked = !isBookmarked;
                });
              },
              child: isBookmarked
                  ? Icon(Icons.bookmark_rounded, size: 28)
                  : Icon(Icons.bookmark_border, size: 28),
            ),
          ),
        ],
      ),
      body: Column(
        spacing: 24,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500/${movie.backdropPath}",
                  width: double.infinity, // full width của SizedBox/Stack
                  height: 210,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 178, right: 16),
                  child: Container(
                    width: 54,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.bgGray,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 4,
                      children: [
                        Image.asset(AppIcons.icStar, height: 16, width: 16),
                        Text(
                          AppConfigs.formatRating(movie.voteAverage ?? 0),
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textOrange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 150, left: 24),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                      width: 100,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 220, left: 132),
                  child: SizedBox(
                    height: 48,
                    width: 220,
                    child: Text(
                      movie.originalTitle ?? "no title",
                      style: AppTextStyle.titleMedium,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              IconLabel(
                image: AppIcons.icCalendarBlank,
                color: AppColors.textGray,
                label: AppConfigs.getYear(movie.releaseDate ?? "2025"),
              ),
              SizedBox(
                height: 20,
                child: VerticalDivider(thickness: 1, color: AppColors.textGray),
              ),
              IconLabel(
                image: AppIcons.icClock,
                color: AppColors.textGray,
                label: " ${movie.runtime} minutes",
              ),
              SizedBox(
                height: 20,
                child: VerticalDivider(thickness: 1, color: AppColors.textGray),
              ),
              IconLabel(
                image: AppIcons.icTicket,
                color: AppColors.textGray,
                label: "Action",
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              movie.overview ?? "",
              style: AppTextStyle.bodysmall,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
