// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:muze/modules/preferences/data/dtos/artists_dto.dart';

part 'music_dto.g.dart';

@JsonSerializable()
class MusicDto {
  String? name;
  List<ArtistMusicDto>? artists;
  String? preview_url;
  String? spotify_url;
  String? track_id;
  ImagesDto? image;

  MusicDto({
    this.name,
    this.artists,
    this.preview_url,
    this.spotify_url,
    this.track_id,
    this.image,
  });

  factory MusicDto.fromJson(Map<String, dynamic> json) => _$MusicDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MusicDtoToJson(this);
}

@JsonSerializable()
class ArtistMusicDto {
  String? name;
  String? model_id;
  String? image_url;
  String? spotify_url;
  String? spotify_artist_id;

  ArtistMusicDto({
    this.name,
    this.model_id,
    this.image_url,
    this.spotify_url,
    this.spotify_artist_id,
  });

  factory ArtistMusicDto.fromJson(Map<String, dynamic> json) => _$ArtistMusicDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistMusicDtoToJson(this);
}
