import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:net_openx_inventory/core/di/dependency_injection.dart';
import 'package:net_openx_inventory/features/login/logic/cubit/login_cubit.dart';
import 'package:net_openx_inventory/core/routing/app_routes.dart';

class NetOpenXApp extends StatelessWidget {
  const NetOpenXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<LoginCubit>(), // Use getIt to provide your LoginCubit
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router, // Use your new router!
        // theme, locale, etc. as needed
      ),
    );
  }
}