import 'package:json_annotation/json_annotation.dart';

part 'sales_response_model.g.dart';

@JsonSerializable()
class SalesResponseModel {

  final String? message;
  final String evrakNo;

  SalesResponseModel({required this.evrakNo, this.message
  });

  factory SalesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SalesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesResponseModelToJson(this);
}