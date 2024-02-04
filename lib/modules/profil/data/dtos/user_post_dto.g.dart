// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPostDto _$UserPostDtoFromJson(Map<String, dynamic> json) => UserPostDto(
      image_src: json['image_src'] as String?,
      spotify_url: json['spotify_url'] as String?,
    );

Map<String, dynamic> _$UserPostDtoToJson(UserPostDto instance) =>
    <String, dynamic>{
      'image_src': instance.image_src,
      'spotify_url': instance.spotify_url,
    };
