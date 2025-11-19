import 'package:movies_app/configs/app_config.dart';
import 'package:movies_app/model/entities/movie_entity.dart';
import 'package:movies_app/model/response/movie_list_response.dart';
import 'package:movies_app/network/api_client.dart';

abstract class MovieRepository {
  Future<MovieListResponse> getMovies({required int page});
  Future<MovieEntity> getDetailMovie({required int id});
}

class MovieRepositoryImpl extends MovieRepository {
  final ApiClient apiClient;

  MovieRepositoryImpl({required this.apiClient});
  @override
  Future<MovieEntity> getDetailMovie({required int id}) {
    return apiClient.getDetailMovie(MovieAPIConfig.apiKey, id);
  }

  @override
  Future<MovieListResponse> getMovies({required int page}) {
    return apiClient.getMovies(MovieAPIConfig.apiKey, page);
  }
}
