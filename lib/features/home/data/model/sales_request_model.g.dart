// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesRequestModel _$SalesRequestModelFromJson(Map<String, dynamic> json) =>
    SalesRequestModel(
      cariKod: json['cariKod'] as String,
      tarih: json['tarih'] as String,
      detaillines:
          (json['detaillines'] as List<dynamic>)
              .map((e) => DetailLine.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$SalesRequestModelToJson(SalesRequestModel instance) =>
    <String, dynamic>{
      'cariKod': instance.cariKod,
      'tarih': instance.tarih,
      'detaillines': instance.detaillines,
    };

DetailLine _$DetailLineFromJson(Map<String, dynamic> json) => DetailLine(
  stokKodu: json['stokKodu'] as String,
  sfraGcmik: (json['sfra_GCMIK'] as num).toInt(),
  sfraBf: (json['sfra_BF'] as num).toInt(),
  depoKodu: (json['depo_KODU'] as num).toInt(),
  toDepoKodu: (json['tO_DEPO_KODU'] as num).toInt(),
  seriNo: json['seriNo'] as String,
  serialQty: (json['serialQty'] as num).toInt(),
);

Map<String, dynamic> _$DetailLineToJson(DetailLine instance) =>
    <String, dynamic>{
      'stokKodu': instance.stokKodu,
      'sfra_GCMIK': instance.sfraGcmik,
      'sfra_BF': instance.sfraBf,
      'depo_KODU': instance.depoKodu,
      'tO_DEPO_KODU': instance.toDepoKodu,
      'seriNo': instance.seriNo,
      'serialQty': instance.serialQty,
    };
