import 'package:json_annotation/json_annotation.dart';

part 'pagination_dto.g.dart';

@JsonSerializable()
class PaginationDto {
  int? to;
  int? total;

  PaginationDto({
    this.to,
    this.total,
  });

  factory PaginationDto.fromJson(Map<String, dynamic> json) => _$PaginationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationDtoToJson(this);
}
