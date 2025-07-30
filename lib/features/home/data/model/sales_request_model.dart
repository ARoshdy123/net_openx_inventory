import 'package:json_annotation/json_annotation.dart';

part 'sales_request_model.g.dart';

@JsonSerializable()
class SalesRequestModel {
  final String cariKod;
  final String tarih;
  final List<DetailLine> detailLines; // Changed from detaillines to detailLines to match API
  final String token; // Added token field

  SalesRequestModel({
    required this.cariKod,
    required this.tarih,
    required this.detailLines,
    required this.token,
  });

  factory SalesRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SalesRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesRequestModelToJson(this);
}

@JsonSerializable()
class DetailLine {
  final String stokKodu; //itemCode
  @JsonKey(name: 'sTra_GCMIK') // Changed to match API format
  final int sTraGcmik;
  @JsonKey(name: 'sTra_BF') // Changed to match API format
  final int sTraBf;
  @JsonKey(name: 'depO_KODU') // Changed to match API format
  final int depoKodu;
  @JsonKey(name: 'tO_DEPO_KODU') // Changed to match API format
  final int toDepoKodu;
  final String seriNo;  // serial number of the table
  final double serialQty;  // serial quantity (changed to double to match API)

  DetailLine({
    required this.stokKodu,
    required this.sTraGcmik,
    required this.sTraBf,
    required this.depoKodu,
    required this.toDepoKodu,
    required this.seriNo,
    required this.serialQty,
  });

  factory DetailLine.fromJson(Map<String, dynamic> json) =>
      _$DetailLineFromJson(json);

  Map<String, dynamic> toJson() => _$DetailLineToJson(this);
}