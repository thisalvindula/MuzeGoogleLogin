// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDto _$PostDtoFromJson(Map<String, dynamic> json) => PostDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      preview_url: json['preview_url'] as String?,
      spotify_url: json['spotify_url'] as String?,
      image_src: json['image_src'] as String?,
      description: json['description'] as String?,
      created_at: json['created_at'] as String?,
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => ArtistMusicDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      track_id: json['track_id'] as String?,
      image: json['image'] == null
          ? null
          : ImagesDto.fromJson(json['image'] as Map<String, dynamic>),
      total_likes: json['total_likes'] as int?,
      liked_by_user: json['liked_by_user'] as bool?,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
      is_suggestion: json['is_suggestion'] as bool?,
    );

Map<String, dynamic> _$PostDtoToJson(PostDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'preview_url': instance.preview_url,
      'spotify_url': instance.spotify_url,
      'image_src': instance.image_src,
      'description': instance.description,
      'created_at': instance.created_at,
      'artists': instance.artists,
      'track_id': instance.track_id,
      'image': instance.image,
      'total_likes': instance.total_likes,
      'liked_by_user': instance.liked_by_user,
      'user': instance.user,
      'is_suggestion': instance.is_suggestion,
    };
