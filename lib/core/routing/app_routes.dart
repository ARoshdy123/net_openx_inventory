import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:net_openx_inventory/core/di/dependency_injection.dart';
import 'package:net_openx_inventory/core/routing/routes.dart';
import 'package:net_openx_inventory/features/home/ui/home_screen.dart';
import 'package:net_openx_inventory/features/login/logic/cubit/login_cubit.dart';
import 'package:net_openx_inventory/features/login/ui/login_screen.dart';

import '../../features/login/logic/cubit/login_state.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.loginScreen,
    // refreshListenable: GoRouterRefreshable(getIt<LoginCubit>().stream), // <-- Updated here!
    redirect: (context, state) {
      final isLoggedIn = getIt<LoginCubit>().state is Success;
      final isOnLogin = state.matchedLocation == Routes.loginScreen;

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
          value: getIt<LoginCubit>(),
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