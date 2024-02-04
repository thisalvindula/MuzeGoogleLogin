// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      id: json['id'] as int?,
      email: json['email'] as String?,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      username: json['username'] as String?,
      email_verified_at: json['email_verified_at'],
      preferences: json['preferences'],
      followers: json['followers'] as int?,
      following: json['following'] as int?,
      user_avatar: json['user_avatar'] as String?,
      is_following: json['is_following'] as bool?,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'username': instance.username,
      'email_verified_at': instance.email_verified_at,
      'preferences': instance.preferences,
      'followers': instance.followers,
      'following': instance.following,
      'user_avatar': instance.user_avatar,
      'is_following': instance.is_following,
    };
