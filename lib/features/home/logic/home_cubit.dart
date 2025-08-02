// home_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:net_openx_inventory/features/home/data/model/sales_request_model.dart';
import 'package:net_openx_inventory/features/home/data/repo/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeState.initial());

  Future<void> getCustomers() async {
    emit(state.copyWith(isLoadingCustomers: true, error: null));

    final result = await homeRepo.getCustomers();
    result.when(
      success: (data) => emit(state.copyWith(
        customers: data,
        isLoadingCustomers: false,
      )),
      failure: (error) => emit(state.copyWith(
        error: error.apiErrorModel.message ?? 'Failed to load customers',
        isLoadingCustomers: false,
      )),
    );
  }

  Future<void> getWarehouses() async {
    emit(state.copyWith(isLoadingWarehouses: true, error: null));

    final result = await homeRepo.getWarehouses();
    result.when(
      success: (data) => emit(state.copyWith(
        warehouses: data,
        isLoadingWarehouses: false,
      )),
      failure: (error) => emit(state.copyWith(
        error: error.apiErrorModel.message ?? 'Failed to load warehouses',
        isLoadingWarehouses: false,
      )),
    );
  }

  Future<void> getBarcode(String barcode) async {
    emit(state.copyWith(isLoadingBarcode: true, error: null));

    final result = await homeRepo.getBarcode(barcode);
    result.when(
      success: (data) => emit(state.copyWith(
        barcodeData: data,
        isLoadingBarcode: false,
      )),
      failure: (error) => emit(state.copyWith(
        error: error.apiErrorModel.message ?? 'Failed to scan barcode',
        isLoadingBarcode: false,
      )),
    );
  }


  Future<void> createSales(SalesRequestModel salesRequest) async {
    emit(state.copyWith(isLoadingSales: true, error: null));

    final result = await homeRepo.postSales(salesRequest);
    result.when(
      success: (salesResponse) {
        print('SUCCESS: Sales created with SalesNumber: ${salesResponse.evrakNo}');
        emit(state.copyWith(
          salesResponse: salesResponse,
          isLoadingSales: false,
        ));
      },
      failure: (error) {
        print('FAILURE: ${error.apiErrorModel.message}');
        String errorMessage = 'Failed to submit sales data';

        // Handle specific timeout errors
        if (error.apiErrorModel.message?.contains('timeout') == true ||
            error.apiErrorModel.message?.contains('receiveTimeout') == true) {
          errorMessage = 'Request timed out. The server might be processing your request. Please check if the transaction was created successfully.';
        }

        emit(state.copyWith(
          error: error.apiErrorModel.message ?? errorMessage,
          isLoadingSales: false,
        ));
      },
    );
  }

  // Load both customers and warehouses
  Future<void> loadInitialData() async {
    await Future.wait([
      getCustomers(),
      getWarehouses(),
    ]);
  }

  void clearError() {
    emit(state.copyWith(error: null));
  }

  void clearBarcodeData() {
    emit(state.copyWith(barcodeData: null));
  }
  void clearSalesResponse() {
    emit(state.copyWith(salesResponse: null));
  }
}