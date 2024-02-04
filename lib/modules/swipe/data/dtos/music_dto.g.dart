// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicDto _$MusicDtoFromJson(Map<String, dynamic> json) => MusicDto(
      name: json['name'] as String?,
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => ArtistMusicDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      preview_url: json['preview_url'] as String?,
      spotify_url: json['spotify_url'] as String?,
      track_id: json['track_id'] as String?,
      image: json['image'] == null
          ? null
          : ImagesDto.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MusicDtoToJson(MusicDto instance) => <String, dynamic>{
      'name': instance.name,
      'artists': instance.artists,
      'preview_url': instance.preview_url,
      'spotify_url': instance.spotify_url,
      'track_id': instance.track_id,
      'image': instance.image,
    };

ArtistMusicDto _$ArtistMusicDtoFromJson(Map<String, dynamic> json) =>
    ArtistMusicDto(
      name: json['name'] as String?,
      model_id: json['model_id'] as String?,
      image_url: json['image_url'] as String?,
      spotify_url: json['spotify_url'] as String?,
      spotify_artist_id: json['spotify_artist_id'] as String?,
    );

Map<String, dynamic> _$ArtistMusicDtoToJson(ArtistMusicDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'model_id': instance.model_id,
      'image_url': instance.image_url,
      'spotify_url': instance.spotify_url,
      'spotify_artist_id': instance.spotify_artist_id,
    };
