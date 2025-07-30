// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesResponseModel _$SalesResponseModelFromJson(Map<String, dynamic> json) =>
    SalesResponseModel(
      evrakNo: json['evrakNo'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SalesResponseModelToJson(SalesResponseModel instance) =>
    <String, dynamic>{'message': instance.message, 'evrakNo': instance.evrakNo};
