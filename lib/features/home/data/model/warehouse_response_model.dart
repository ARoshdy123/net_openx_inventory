import 'package:json_annotation/json_annotation.dart';
part 'warehouse_response_model.g.dart';

@JsonSerializable()
class WarehouseResponseModel {
  final String disabled;
  final String? group;
  final String selected;
  @JsonKey(name: 'text')
  final String warehouse;
  final String value;

  WarehouseResponseModel({
    required this.disabled,
    this.group,
    required this.selected,
    required this.warehouse,
    required this.value,
  });

  factory WarehouseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WarehouseResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseResponseModelToJson(this);
}
