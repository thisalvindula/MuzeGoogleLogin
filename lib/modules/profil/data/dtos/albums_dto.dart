// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:muze/modules/preferences/data/dtos/artists_dto.dart';

part 'albums_dto.g.dart';

@JsonSerializable()
class AlbumDto {
  List<ImagesDto>? images;
  Map<String, String>? external_urls;

  AlbumDto({
    this.images,
    this.external_urls,
  });

  factory AlbumDto.fromJson(Map<String, dynamic> json) => _$AlbumDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumDtoToJson(this);
}
