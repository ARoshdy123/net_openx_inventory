import 'package:json_annotation/json_annotation.dart';
part 'barcode_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BarcodeResponseModel {
  @JsonKey(name: 'stokKodu')
  final String itemCode;
  @JsonKey(name: 'stokAdi')
  final String itemName;
  final int depoKod; //300
  @JsonKey(name: 'balanceQty')
  final double balanceQuantity;
  @JsonKey(name: 'olcuBr1')
  final String unit;
  final double serialQty;
  @JsonKey(name: 'seriNo')
  final String barcode;

  BarcodeResponseModel({
    required this.itemCode,
    required this.itemName,
    required this.depoKod,
    required this.balanceQuantity,
    required this.unit,
    required this.serialQty,
    required this.barcode,
  });

  factory BarcodeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BarcodeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BarcodeResponseModelToJson(this);
}
