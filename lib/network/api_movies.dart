import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/configs/app_config.dart';
import 'package:movies_app/model/entities/movie_entity.dart';
import 'package:movies_app/model/response/movie_list_response.dart';

Future<MovieListResponse> fetchMovies() async {
  final apiKey = MovieAPIConfig.apiKey;
  final response = await http.get(
    Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apiKey'),
    headers: {"accept": "application/json"},
  );
  if (response.statusCode == 200) {
    return MovieListResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load film: ${response.statusCode}');
  }
}

Future<MovieEntity> fetchMovieDetail(int id) async {
  final apiKey = MovieAPIConfig.apiKey;
  final response = await http.get(
    Uri.parse('https://api.themoviedb.org/3/movie/$id?api_key=$apiKey'),
    headers: {"accept": "application/json"},
  );

  if (response.statusCode == 200) {
    return MovieEntity.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load film: ${response.statusCode}');
  }
}
