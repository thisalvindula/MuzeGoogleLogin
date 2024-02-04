// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:muze/modules/auth/data/dtos/user_dto.dart';

part 'likes_dto.g.dart';

@JsonSerializable()
class LikeDto {
  String? created_at;
  UserDto? user;

  LikeDto({
    this.created_at,
    this.user,
  });

  factory LikeDto.fromJson(Map<String, dynamic> json) => _$LikeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LikeDtoToJson(this);
}

@JsonSerializable()
class LikesDto {
  List<LikeDto>? content;

  LikesDto({
    this.content,
  });

  factory LikesDto.fromJson(Map<String, dynamic> json) => _$LikesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LikesDtoToJson(this);
}
