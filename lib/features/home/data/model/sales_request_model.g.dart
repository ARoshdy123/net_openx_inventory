// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesRequestModel _$SalesRequestModelFromJson(Map<String, dynamic> json) =>
    SalesRequestModel(
      cariKod: json['cariKod'] as String,
      tarih: json['tarih'] as String,
      detailLines:
          (json['detailLines'] as List<dynamic>)
              .map((e) => DetailLine.fromJson(e as Map<String, dynamic>))
              .toList(),
      token: json['token'] as String,
    );

Map<String, dynamic> _$SalesRequestModelToJson(SalesRequestModel instance) =>
    <String, dynamic>{
      'cariKod': instance.cariKod,
      'tarih': instance.tarih,
      'detailLines': instance.detailLines,
      'token': instance.token,
    };

DetailLine _$DetailLineFromJson(Map<String, dynamic> json) => DetailLine(
  stokKodu: json['stokKodu'] as String,
  sTraGcmik: (json['sTra_GCMIK'] as num).toInt(),
  sTraBf: (json['sTra_BF'] as num).toInt(),
  depoKodu: (json['depO_KODU'] as num).toInt(),
  toDepoKodu: (json['tO_DEPO_KODU'] as num).toInt(),
  seriNo: json['seriNo'] as String,
  serialQty: (json['serialQty'] as num).toDouble(),
);

Map<String, dynamic> _$DetailLineToJson(DetailLine instance) =>
    <String, dynamic>{
      'stokKodu': instance.stokKodu,
      'sTra_GCMIK': instance.sTraGcmik,
      'sTra_BF': instance.sTraBf,
      'depO_KODU': instance.depoKodu,
      'tO_DEPO_KODU': instance.toDepoKodu,
      'seriNo': instance.seriNo,
      'serialQty': instance.serialQty,
    };
