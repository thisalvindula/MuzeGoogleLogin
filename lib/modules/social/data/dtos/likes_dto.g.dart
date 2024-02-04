// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'likes_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikeDto _$LikeDtoFromJson(Map<String, dynamic> json) => LikeDto(
      created_at: json['created_at'] as String?,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LikeDtoToJson(LikeDto instance) => <String, dynamic>{
      'created_at': instance.created_at,
      'user': instance.user,
    };

LikesDto _$LikesDtoFromJson(Map<String, dynamic> json) => LikesDto(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => LikeDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LikesDtoToJson(LikesDto instance) => <String, dynamic>{
      'content': instance.content,
    };
