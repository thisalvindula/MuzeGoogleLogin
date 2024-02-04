// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  int? id;
  String? email;
  String? first_name;
  String? last_name;
  String? username;
  dynamic email_verified_at;
  dynamic preferences;
  int? followers;
  int? following;
  String? user_avatar;
  bool? is_following;

  UserDto({
    this.id,
    this.email,
    this.first_name,
    this.last_name,
    this.username,
    this.email_verified_at,
    this.preferences,
    this.followers,
    this.following,
    this.user_avatar,
    this.is_following,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
