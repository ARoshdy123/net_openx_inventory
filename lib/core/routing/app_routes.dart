import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:net_openx_inventory/core/routing/routes.dart';
import 'package:net_openx_inventory/features/home/logic/home_cubit.dart';
import 'package:net_openx_inventory/features/home/ui/home_screen.dart';
import 'package:net_openx_inventory/features/login/logic/cubit/login_cubit.dart';
import 'package:net_openx_inventory/features/login/ui/login_screen.dart';

import '../../features/login/logic/cubit/login_state.dart';
final getIt = GetIt.instance;

class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.loginScreen,
    // redirect based on auth state
    redirect: (context, state) {
      final isLoggedIn = context.read <LoginCubit>().state is Success;
      final isOnLogin  = state.matchedLocation == Routes.loginScreen;
      if (!isLoggedIn && !isOnLogin)   return Routes.loginScreen;
      if ( isLoggedIn &&  isOnLogin)    return Routes.homeScreen;
      return null;
    },
    routes: [
      GoRoute(
        name: 'loginScreen',
        path: Routes.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: 'homeScreen',
        path: Routes.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}