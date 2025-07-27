import 'package:net_openx_inventory/features/home/data/model/barcode_response_model.dart';
import 'package:net_openx_inventory/features/home/data/model/customer_response_model.dart';
import 'package:net_openx_inventory/features/home/data/model/warehouse_response_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:net_openx_inventory/core/networking/api_constants.dart';
part 'home_api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiServices {
  factory HomeApiServices(Dio dio) = _HomeApiServices;

  @GET(ApiConstants.barcodeEndpoint)
  Future<BarcodeResponseModel> getBarcode(@Query('barcode') String barcode); // here 'barcode' is the query parameter name to search for the barcode

  @GET(ApiConstants.customerEndpoint)
  Future<CustomerResponseModel> getCustomers();

  @GET(ApiConstants.warehouseEndpoint)
  Future<WarehouseResponseModel> getWarehouses();
}
