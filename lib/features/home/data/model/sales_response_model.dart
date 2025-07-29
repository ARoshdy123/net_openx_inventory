import 'package:json_annotation/json_annotation.dart';

part 'sales_response_model.g.dart';

@JsonSerializable()
class SalesResponseModel {
  final bool? success;
  final String? message;
  final int? statusCode;
  final dynamic data;

  SalesResponseModel({
    this.success,
    this.message,
    this.statusCode,
    this.data,
  });

  factory SalesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SalesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesResponseModelToJson(this);
}