import 'package:json_annotation/json_annotation.dart';
part 'customer_response_model.g.dart';

@JsonSerializable()
class CustomerResponseModel {
  final String disabled;
  final String? group;
  final String selected;
  @JsonKey(name: 'text')
  final String clientName;
  final String value;

  CustomerResponseModel({
    required this.disabled,
    this.group,
    required this.selected,
    required this.clientName,
    required this.value,
  });

  factory CustomerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerResponseModelToJson(this);
}
