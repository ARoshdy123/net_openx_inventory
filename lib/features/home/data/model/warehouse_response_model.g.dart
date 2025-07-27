// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseResponseModel _$WarehouseResponseModelFromJson(
  Map<String, dynamic> json,
) => WarehouseResponseModel(
  disabled: json['disabled'] as bool,
  group: json['group'] as String?,
  selected: json['selected'] as bool,
  text: json['text'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$WarehouseResponseModelToJson(
  WarehouseResponseModel instance,
) => <String, dynamic>{
  'disabled': instance.disabled,
  'group': instance.group,
  'selected': instance.selected,
  'text': instance.text,
  'value': instance.value,
};
