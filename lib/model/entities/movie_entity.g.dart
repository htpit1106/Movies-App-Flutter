// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieEntity _$MovieEntityFromJson(Map<String, dynamic> json) => MovieEntity(
  id: (json['id'] as num).toInt(),
  voteAverage: (json['vote_average'] as num?)?.toDouble(),
  releaseDate: json['release_date'] as String?,
  originalTitle: json['original_title'] as String?,
  posterPath: json['poster_path'] as String?,
  genreIds: (json['genre_ids'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  backdropPath: json['backdrop_path'] as String?,
  runtime: (json['runtime'] as num?)?.toInt(),
  overview: json['overview'] as String?,
);

Map<String, dynamic> _$MovieEntityToJson(MovieEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vote_average': instance.voteAverage,
      'release_date': instance.releaseDate,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
      'genre_ids': instance.genreIds,
      'backdrop_path': instance.backdropPath,
      'runtime': instance.runtime,
      'overview': instance.overview,
    };
