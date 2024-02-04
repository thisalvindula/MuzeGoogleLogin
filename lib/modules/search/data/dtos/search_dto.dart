// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:muze/modules/preferences/data/dtos/artists_dto.dart';
import 'package:muze/modules/preferences/data/dtos/pagination_dto.dart';

part 'search_dto.g.dart';

@JsonSerializable()
class SearchDto {
  String? name;
  List<ImagesDto>? images;
  String? id;

  SearchDto({
    this.name,
    this.images,
    this.id,
  });

  factory SearchDto.fromJson(Map<String, dynamic> json) => _$SearchDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchDtoToJson(this);
}

@JsonSerializable()
class DataSearchDto {
  List? content;
  PaginationDto? pagination;

  DataSearchDto({
    this.content,
    this.pagination,
  });

  factory DataSearchDto.fromJson(Map<String, dynamic> json) => _$DataSearchDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DataSearchDtoToJson(this);
}
