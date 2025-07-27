import 'package:json_annotation/json_annotation.dart';
part 'customer_response_model.g.dart';

@JsonSerializable()
class CustomerResponseModel {
  final bool disabled;
  final String? group;
  final bool selected;
  final String text;
  final String value;

  CustomerResponseModel({
    required this.disabled,
    this.group,
    required this.selected,
    required this.text,
    required this.value,
  });

  factory CustomerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerResponseModelToJson(this);
}
