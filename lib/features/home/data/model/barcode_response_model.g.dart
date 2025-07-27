// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarcodeResponseModel _$BarcodeResponseModelFromJson(
  Map<String, dynamic> json,
) => BarcodeResponseModel(
  itemCode: json['stokKodu'] as String,
  itemName: json['stockAdi'] as String,
  depoKod: (json['depoKod'] as num).toInt(),
  balanceQuantity: (json['balanceQty'] as num).toDouble(),
  unit: json['olcuBr1'] as String,
  serialQty: (json['serialQty'] as num).toDouble(),
  barcode: json['seriNo'] as String,
);

Map<String, dynamic> _$BarcodeResponseModelToJson(
  BarcodeResponseModel instance,
) => <String, dynamic>{
  'stokKodu': instance.itemCode,
  'stockAdi': instance.itemName,
  'depoKod': instance.depoKod,
  'balanceQty': instance.balanceQuantity,
  'olcuBr1': instance.unit,
  'serialQty': instance.serialQty,
  'seriNo': instance.barcode,
};
