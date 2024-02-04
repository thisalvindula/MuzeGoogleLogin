// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable()
class APIResponse {
  bool? success;
  int? status;
  String? message;
  Map<String, dynamic>? data;
  APIResponse({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  factory APIResponse.fromJson(Map<String, dynamic> json) => _$APIResponseFromJson(json);

  Map<String, dynamic> toJson() => _$APIResponseToJson(this);
}
