// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'user_post_dto.g.dart';

@JsonSerializable()
class UserPostDto {
  String? image_src;
  String? spotify_url;

  UserPostDto({
    this.image_src,
    this.spotify_url,
  });

  factory UserPostDto.fromJson(Map<String, dynamic> json) => _$UserPostDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserPostDtoToJson(this);
}
