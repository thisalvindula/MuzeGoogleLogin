// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artists_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagesDto _$ImagesDtoFromJson(Map<String, dynamic> json) => ImagesDto(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ImagesDtoToJson(ImagesDto instance) => <String, dynamic>{
      'url': instance.url,
    };

ArtistsDto _$ArtistsDtoFromJson(Map<String, dynamic> json) => ArtistsDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImagesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArtistsDtoToJson(ArtistsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'images': instance.images,
    };

DataArtistsDto _$DataArtistsDtoFromJson(Map<String, dynamic> json) =>
    DataArtistsDto(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => ArtistsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginationDto.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataArtistsDtoToJson(DataArtistsDto instance) =>
    <String, dynamic>{
      'content': instance.content,
      'pagination': instance.pagination,
    };
