import 'package:bloc/bloc.dart';
import 'package:net_openx_inventory/features/home/data/repo/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeState.initial());

  Future<void> getBarcode(String barcode) async {
    emit(HomeState.loading());
    final result = await homeRepo.getBarcode(barcode);
    result.when(
      success: (data) => emit(HomeState.barcodeLoaded(data)),
      failure:
          (error) => emit(
            HomeState.error(error.apiErrorModel.message ?? 'An error occurred'),
          ),
    );
  }

  Future<void> getCustomers() async {
    emit(HomeState.loading());
    final result = await homeRepo.getCustomers();
    result.when(
      success: (data) => emit(HomeState.customerLoaded(data)),
      failure:
          (error) => emit(
            HomeState.error(error.apiErrorModel.message ?? 'An error occurred'),
          ),
    );
  }

  Future<void> getWarehouses() async {
    emit(HomeState.loading());
    final result = await homeRepo.getWarehouses();
    result.when(
      success: (data) => emit(HomeState.warehouseLoaded(data)),
      failure:
          (error) => emit(
            HomeState.error(error.apiErrorModel.message ?? 'An error occurred'),
          ),
    );
  }
}
