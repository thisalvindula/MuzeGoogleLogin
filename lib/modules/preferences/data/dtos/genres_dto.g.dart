// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenresDto _$GenresDtoFromJson(Map<String, dynamic> json) => GenresDto(
      model_id: json['model_id'] as String?,
      name: json['name'] as String?,
      image_url: json['image_url'] as String?,
    );

Map<String, dynamic> _$GenresDtoToJson(GenresDto instance) => <String, dynamic>{
      'model_id': instance.model_id,
      'name': instance.name,
      'image_url': instance.image_url,
    };

DataGenresDto _$DataGenresDtoFromJson(Map<String, dynamic> json) =>
    DataGenresDto(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => GenresDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginationDto.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataGenresDtoToJson(DataGenresDto instance) =>
    <String, dynamic>{
      'content': instance.content,
      'pagination': instance.pagination,
    };
