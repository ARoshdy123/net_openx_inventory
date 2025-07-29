// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesResponseModel _$SalesResponseModelFromJson(Map<String, dynamic> json) =>
    SalesResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: json['data'],
    );

Map<String, dynamic> _$SalesResponseModelToJson(SalesResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };
