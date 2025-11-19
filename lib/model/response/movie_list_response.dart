import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/model/entities/movie_entity.dart';

part 'movie_list_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieListResponse {
  @JsonKey(defaultValue: 1)
  final int page;
  @JsonKey(defaultValue: [])
  final List<MovieEntity> results;
  final int totalPages;
  final int totalResults;

  const MovieListResponse(
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  );

  factory MovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListResponseToJson(this);
}
