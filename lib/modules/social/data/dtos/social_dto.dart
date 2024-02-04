// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:muze/modules/auth/data/dtos/user_dto.dart';
import 'package:muze/modules/preferences/data/dtos/artists_dto.dart';
import 'package:muze/modules/swipe/data/dtos/music_dto.dart';

part 'social_dto.g.dart';

@JsonSerializable()
class PostDto {
  int? id;
  String? title;
  String? preview_url;
  String? spotify_url;
  String? image_src;
  String? description;
  String? created_at;
  List<ArtistMusicDto>? artists;
  String? track_id;
  ImagesDto? image;
  int? total_likes;
  bool? liked_by_user;
  UserDto? user;
  bool? is_suggestion;

  PostDto({
    this.id,
    this.title,
    this.preview_url,
    this.spotify_url,
    this.image_src,
    this.description,
    this.created_at,
    this.artists,
    this.track_id,
    this.image,
    this.total_likes,
    this.liked_by_user,
    this.user,
    this.is_suggestion,
  });

  factory PostDto.fromJson(Map<String, dynamic> json) => _$PostDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PostDtoToJson(this);
}
