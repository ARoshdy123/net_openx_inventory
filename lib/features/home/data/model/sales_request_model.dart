import 'package:json_annotation/json_annotation.dart';

part 'sales_request_model.g.dart';

@JsonSerializable()
class SalesRequestModel {
  final String cariKod;
  final String tarih;
  final List<DetailLine> detaillines;

  SalesRequestModel({
    required this.cariKod,
    required this.tarih,
    required this.detaillines,
  });

  factory SalesRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SalesRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesRequestModelToJson(this);
}

@JsonSerializable()
class DetailLine {
  final String stokKodu; //itemCode
  @JsonKey(name: 'sfra_GCMIK') // 0
  final int sfraGcmik;
  @JsonKey(name: 'sfra_BF') // 0
  final int sfraBf;
  @JsonKey(name: 'depo_KODU') // warehouse value
  final int depoKodu;
  @JsonKey(name: 'tO_DEPO_KODU') //warehouse value
  final int toDepoKodu;
  final String seriNo;  // serial number of the table
  final int serialQty;

  DetailLine({
    required this.stokKodu,
    required this.sfraGcmik,
    required this.sfraBf,
    required this.depoKodu,
    required this.toDepoKodu,
    required this.seriNo,
    required this.serialQty,
  });

  factory DetailLine.fromJson(Map<String, dynamic> json) =>
      _$DetailLineFromJson(json);

  Map<String, dynamic> toJson() => _$DetailLineToJson(this);
}
