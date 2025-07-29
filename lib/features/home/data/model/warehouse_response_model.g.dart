// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseResponseModel _$WarehouseResponseModelFromJson(
  Map<String, dynamic> json,
) => WarehouseResponseModel(
  disabled: json['disabled'] as String,
  group: json['group'] as String?,
  selected: json['selected'] as String,
  warehouse: json['text'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$WarehouseResponseModelToJson(
  WarehouseResponseModel instance,
) => <String, dynamic>{
  'disabled': instance.disabled,
  'group': instance.group,
  'selected': instance.selected,
  'text': instance.warehouse,
  'value': instance.value,
};
