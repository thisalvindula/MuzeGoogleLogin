// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:muze/modules/preferences/data/dtos/artists_dto.dart';

part 'artist_dto.g.dart';

@JsonSerializable()
class ArtistDto {
  String? name;
  String? id;
  List<ImagesDto>? images;
  Map<String, String>? external_urls;
  Map<String, dynamic>? followers;
  bool? is_followed;

  ArtistDto({
    this.name,
    this.id,
    this.images,
    this.external_urls,
    this.followers,
    this.is_followed,
  });

  factory ArtistDto.fromJson(Map<String, dynamic> json) => _$ArtistDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistDtoToJson(this);
}
