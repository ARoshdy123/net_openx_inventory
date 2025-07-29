import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:net_openx_inventory/core/di/dependency_injection.dart';
import 'package:net_openx_inventory/core/helpers/shared_pref_helper.dart';
import 'package:net_openx_inventory/core/networking/dio_factory.dart';
import 'package:net_openx_inventory/features/home/logic/home_cubit.dart';
import 'package:net_openx_inventory/features/login/logic/cubit/login_cubit.dart';
import 'package:net_openx_inventory/net_openx.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await checkIfLoggedInUser();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (_) => getIt<LoginCubit>(),
        ),
        BlocProvider<HomeCubit>(
          create: (_) => getIt<HomeCubit>(),
        ),
      ],
      child: const NetOpenXApp(),
    ),
  );
}

Future<void> checkIfLoggedInUser() async {
  final userToken =
  await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

  if (userToken != null && userToken.isNotEmpty) {
    DioFactory.setToken(userToken);
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}