// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumDto _$AlbumDtoFromJson(Map<String, dynamic> json) => AlbumDto(
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImagesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      external_urls: (json['external_urls'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$AlbumDtoToJson(AlbumDto instance) => <String, dynamic>{
      'images': instance.images,
      'external_urls': instance.external_urls,
    };
