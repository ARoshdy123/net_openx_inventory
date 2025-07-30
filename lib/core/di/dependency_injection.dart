import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:net_openx_inventory/core/networking/dio_factory.dart';
import 'package:net_openx_inventory/features/home/data/data_sources/home_api_services.dart';
import 'package:net_openx_inventory/features/home/data/repo/home_repo.dart';
import 'package:net_openx_inventory/features/home/logic/home_cubit.dart';
import 'package:net_openx_inventory/features/login/data/data_sources/login_api_service.dart';
import 'package:net_openx_inventory/features/login/data/repos/login_repo.dart';
import 'package:net_openx_inventory/features/login/logic/cubit/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService - Register Dio as singleton first
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  // Login services
  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(getIt<Dio>()));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<LoginApiService>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  // Home services - CHANGED: Use factory for HomeCubit to avoid state issues
  getIt.registerLazySingleton<HomeApiServices>(() => HomeApiServices(getIt<Dio>()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<HomeApiServices>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>())); // Changed to factory
}