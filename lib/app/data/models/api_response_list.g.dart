// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIResponseList _$APIResponseListFromJson(Map<String, dynamic> json) =>
    APIResponseList(
      success: json['success'] as bool?,
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$APIResponseListToJson(APIResponseList instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
