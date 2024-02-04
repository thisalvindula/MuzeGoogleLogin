import 'package:json_annotation/json_annotation.dart';
import 'package:muze/modules/preferences/data/dtos/pagination_dto.dart';

part 'artists_dto.g.dart';

@JsonSerializable()
class ImagesDto {
  String? url;

  ImagesDto({
    this.url,
  });

  factory ImagesDto.fromJson(Map<String, dynamic> json) => _$ImagesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesDtoToJson(this);
}

@JsonSerializable()
class ArtistsDto {
  String? id;
  String? name;
  List<ImagesDto>? images;

  ArtistsDto({
    this.id,
    this.name,
    this.images,
  });

  factory ArtistsDto.fromJson(Map<String, dynamic> json) => _$ArtistsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistsDtoToJson(this);
}

@JsonSerializable()
class DataArtistsDto {
  List<ArtistsDto>? content;
  PaginationDto? pagination;

  DataArtistsDto({
    this.content,
    this.pagination,
  });

  factory DataArtistsDto.fromJson(Map<String, dynamic> json) => _$DataArtistsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DataArtistsDtoToJson(this);
}
