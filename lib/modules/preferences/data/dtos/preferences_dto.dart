// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'preferences_dto.g.dart';

@JsonSerializable()
class PreferencesDto {
  String? name;

  PreferencesDto({
    this.name,
  });

  factory PreferencesDto.fromJson(Map<String, dynamic> json) => _$PreferencesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PreferencesDtoToJson(this);
}
