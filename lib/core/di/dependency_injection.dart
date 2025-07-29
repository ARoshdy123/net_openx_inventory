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
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  // Register Dio  one instance
  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //home
  getIt.registerLazySingleton(() => HomeApiServices(dio));
  getIt.registerLazySingleton(() => HomeRepo(getIt()));
  getIt.registerLazySingleton(() => HomeCubit(getIt()));


}
