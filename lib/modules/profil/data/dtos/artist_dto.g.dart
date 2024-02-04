// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistDto _$ArtistDtoFromJson(Map<String, dynamic> json) => ArtistDto(
      name: json['name'] as String?,
      id: json['id'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImagesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      external_urls: (json['external_urls'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      followers: json['followers'] as Map<String, dynamic>?,
      is_followed: json['is_followed'] as bool?,
    );

Map<String, dynamic> _$ArtistDtoToJson(ArtistDto instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'images': instance.images,
      'external_urls': instance.external_urls,
      'followers': instance.followers,
      'is_followed': instance.is_followed,
    };
