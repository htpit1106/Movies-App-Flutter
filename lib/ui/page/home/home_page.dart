import 'package:flutter/material.dart';
import 'package:movies_app/configs/app_config.dart';
import 'package:movies_app/model/entities/movie_entity.dart';
import 'package:movies_app/ui/widgets/movie_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../network/api_util.dart';
import '../../../repository/movie_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieEntity> movies = [];
  late final MovieRepository repository;
  final ScrollController controller = ScrollController();

  // loadMore
  int currentPage = 1;
  bool isLoading = false;
  bool isLoadMore = false;
  bool hasMore = true;


  @override
  void initState() {
    super.initState();
    repository = MovieRepositoryImpl(apiClient: ApiUtil.apiClient);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadMovies(1);
    });

    //load_more
    controller.addListener(() {
      if (controller.position.pixels >= controller.position.maxScrollExtent) {
        loadMore();
      }
    });

    // reload
    controller.addListener(() {
      if (controller.position.pixels <
          controller.position.minScrollExtent - 100) {
        reload();
      }
    });
  }

  Future<void> _loadMovies(int pageNumber) async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });

    final response = await repository.getMovies(page: pageNumber);
    final loadMovies = response.results;
    //
    final prefs = await SharedPreferences.getInstance();
    final List<String> moviesIdBookmark = prefs.getStringList('id') ?? [];
    loadMovies.sort((a, b) {
      final aWatched = moviesIdBookmark.contains(a.id.toString());
      final bWatched = moviesIdBookmark.contains(b.id.toString());
      if (aWatched && !bWatched) return -1;
      if (!aWatched && bWatched) return 1;
      return 0;
    });

    movies = loadMovies;

    setState(() {
      isLoading = false;
    });
  }

  // load more

  Future<void> loadMore() async {
    if (isLoadMore || !hasMore) return;
    setState(() {
      isLoadMore = true;
    });

    final response = await repository.getMovies(page: currentPage + 1);
    hasMore = currentPage < response.totalPages;
    movies.addAll(response.results);
    currentPage++;
    isLoadMore = false;
    setState(() {});
  }

  // reloading
  Future<void> reload() async {

    movies.clear();
    currentPage = 1;
    hasMore = true;
    _loadMovies(1);

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movies")),
      body: ListView.builder(
        controller: controller,
        itemCount: movies.length + (isLoadMore ? 1 : 0) + (isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == movies.length || isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          final movie = movies[index];

          return MovieCard(
            id: movie.id,
            imagePath: "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
            originalTitle: movie.originalTitle,
            releaseDate: AppConfigs.getYear(movie.releaseDate ?? "no time"),
            voteAverage: AppConfigs.formatRating(movie.voteAverage ?? 0),
          );
        },
      ),
    );
  }
}
