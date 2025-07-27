import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:net_openx_inventory/features/home/data/model/barcode_response_model.dart';
import 'package:net_openx_inventory/features/home/data/model/customer_response_model.dart';
import 'package:net_openx_inventory/features/home/data/model/warehouse_response_model.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = Loading;

  const factory HomeState.barcodeLoaded(BarcodeResponseModel data) =
      BarcodeLoaded;
  const factory HomeState.customerLoaded(CustomerResponseModel data) =
      CustomerLoaded;
  const factory HomeState.warehouseLoaded(WarehouseResponseModel data) =
      WarehouseLoaded;

  const factory HomeState.error(String message) = Error;
}
