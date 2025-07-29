// home_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:net_openx_inventory/features/home/data/model/barcode_response_model.dart';
import 'package:net_openx_inventory/features/home/data/model/customer_response_model.dart';
import 'package:net_openx_inventory/features/home/data/model/warehouse_response_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoadingCustomers,
    @Default(false) bool isLoadingWarehouses,
    @Default(false) bool isLoadingBarcode,
    @Default([]) List<CustomerResponseModel> customers,
    @Default([]) List<WarehouseResponseModel> warehouses,
    BarcodeResponseModel? barcodeData,
    String? error,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState();
}