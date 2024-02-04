// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchDto _$SearchDtoFromJson(Map<String, dynamic> json) => SearchDto(
      name: json['name'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImagesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$SearchDtoToJson(SearchDto instance) => <String, dynamic>{
      'name': instance.name,
      'images': instance.images,
      'id': instance.id,
    };

DataSearchDto _$DataSearchDtoFromJson(Map<String, dynamic> json) =>
    DataSearchDto(
      content: json['content'] as List<dynamic>?,
      pagination: json['pagination'] == null
          ? null
          : PaginationDto.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataSearchDtoToJson(DataSearchDto instance) =>
    <String, dynamic>{
      'content': instance.content,
      'pagination': instance.pagination,
    };
