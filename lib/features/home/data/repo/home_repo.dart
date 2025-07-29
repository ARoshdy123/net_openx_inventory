import 'package:dio/dio.dart';
import 'package:net_openx_inventory/core/networking/api_error_handler.dart';
import 'package:net_openx_inventory/core/networking/api_result.dart';
import 'package:net_openx_inventory/features/home/data/data_sources/home_api_services.dart';
import 'package:net_openx_inventory/features/home/data/model/barcode_response_model.dart';
import 'package:net_openx_inventory/features/home/data/model/customer_response_model.dart';
import 'package:net_openx_inventory/features/home/data/model/warehouse_response_model.dart';

class HomeRepo {
  final HomeApiServices _homeApiServices;
  HomeRepo(this._homeApiServices);
  Future<ApiResult<BarcodeResponseModel>> getBarcode(String barcode) async {
    try {
      final response = await _homeApiServices.getBarcode();
      return ApiResult.success(response);
    } on DioException catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<CustomerResponseModel>>> getCustomers() async {
    try {
      final response = await _homeApiServices.getCustomers();
      return ApiResult.success(response);
    } on DioException catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<WarehouseResponseModel>>> getWarehouses() async {
    try {
      final response = await _homeApiServices.getWarehouses();
      return ApiResult.success(response);
    } on DioException catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
