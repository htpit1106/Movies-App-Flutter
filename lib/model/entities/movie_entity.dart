import 'package:json_annotation/json_annotation.dart';

part 'movie_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieEntity {
  final int id;
  final double? voteAverage;
  final String? releaseDate;
  final String? originalTitle;
  final String? posterPath;
  final List<int>? genreIds;
  final String? backdropPath;
  final int? runtime;
  final String? overview;
  MovieEntity({
    required this.id,
    this.voteAverage,
    this.releaseDate,
    this.originalTitle,
    this.posterPath,
    this.genreIds,
    this.backdropPath,
    this.runtime,
    this.overview,
  });

  factory MovieEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieEntityFromJson(json);
  Map<String, dynamic> toJson() => _$MovieEntityToJson(this);
}
