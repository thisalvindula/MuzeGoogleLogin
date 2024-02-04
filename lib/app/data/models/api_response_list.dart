// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'api_response_list.g.dart';

@JsonSerializable()
class APIResponseList {
  bool? success;
  int? status;
  String? message;
  List<dynamic>? data;
  APIResponseList({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  factory APIResponseList.fromJson(Map<String, dynamic> json) => _$APIResponseListFromJson(json);

  Map<String, dynamic> toJson() => _$APIResponseListToJson(this);
}
