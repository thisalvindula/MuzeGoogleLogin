// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaylistDto _$PlaylistDtoFromJson(Map<String, dynamic> json) => PlaylistDto(
      name: json['name'] as String?,
      id: json['id'] as String?,
      image: json['image'] == null
          ? null
          : ImagesDto.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaylistDtoToJson(PlaylistDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
