// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:muze/modules/preferences/data/dtos/artists_dto.dart';

part 'playlist_dto.g.dart';

@JsonSerializable()
class PlaylistDto {
  String? id;
  String? name;
  ImagesDto? image;

  PlaylistDto({
    this.name,
    this.id,
    this.image,
  });

  factory PlaylistDto.fromJson(Map<String, dynamic> json) => _$PlaylistDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistDtoToJson(this);
}
