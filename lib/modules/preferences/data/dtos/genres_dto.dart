// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:muze/modules/preferences/data/dtos/pagination_dto.dart';

part 'genres_dto.g.dart';

@JsonSerializable()
class GenresDto {
  String? model_id;
  String? name;
  String? image_url;

  GenresDto({
    this.model_id,
    this.name,
    this.image_url,
  });

  factory GenresDto.fromJson(Map<String, dynamic> json) => _$GenresDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GenresDtoToJson(this);
}

@JsonSerializable()
class DataGenresDto {
  List<GenresDto>? content;
  PaginationDto? pagination;

  DataGenresDto({
    this.content,
    this.pagination,
  });

  factory DataGenresDto.fromJson(Map<String, dynamic> json) => _$DataGenresDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DataGenresDtoToJson(this);
}
