// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerResponseModel _$CustomerResponseModelFromJson(
  Map<String, dynamic> json,
) => CustomerResponseModel(
  disabled: json['disabled'] as bool,
  group: json['group'] as String?,
  selected: json['selected'] as bool,
  text: json['text'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$CustomerResponseModelToJson(
  CustomerResponseModel instance,
) => <String, dynamic>{
  'disabled': instance.disabled,
  'group': instance.group,
  'selected': instance.selected,
  'text': instance.text,
  'value': instance.value,
};
