import 'package:dio/dio.dart';
import 'package:movies_app/model/entities/movie_entity.dart';
import 'package:movies_app/model/response/movie_list_response.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // list popular film
  // /3/movie/popular
  @GET("/3/movie/popular")
  Future<MovieListResponse> getMovies(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );

  @GET("/3/movie/{id}")
  Future<MovieEntity> getDetailMovie(
    @Query('api_key') String apiKey,
    @Path('id') int id,
  );
}
