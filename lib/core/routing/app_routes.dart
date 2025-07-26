import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:net_openx_inventory/core/di/dependency_injection.dart';
import 'package:net_openx_inventory/core/routing/routes.dart';
import 'package:net_openx_inventory/features/login/logic/cubit/login_cubit.dart';
import 'package:net_openx_inventory/features/login/ui/login_screen.dart';

class AppRouter {
  late final GoRouter router;

  AppRouter(LoginCubit loginCubit) {
    router = GoRouter(
      initialLocation: Routes.loginScreen,
      redirect: (context, state) {
        final isLoggedIn = loginCubit.state is LoginSuccess; // Adjust to match your LoginState
        final isOnLogin = state.subloc == Routes.loginScreen;

        if (!isLoggedIn && !isOnLogin) {
          return Routes.loginScreen;
        }
        if (isLoggedIn && isOnLogin) {
          return Routes.homeScreen;
        }
        return null;
      },
      routes: [
        GoRoute(
          path: Routes.loginScreen,


          builder: (context, state) => BlocProvider.value(
            value: loginCubit,
            child: const LoginScreen(),
          ),
        ),
        GoRoute(
          path: Routes.homeScreen,
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    );
  }
}