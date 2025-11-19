// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListResponse _$MovieListResponseFromJson(Map<String, dynamic> json) =>
    MovieListResponse(
      (json['page'] as num?)?.toInt() ?? 1,
      (json['results'] as List<dynamic>?)
              ?.map((e) => MovieEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['total_pages'] as num).toInt(),
      (json['total_results'] as num).toInt(),
    );

Map<String, dynamic> _$MovieListResponseToJson(MovieListResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
