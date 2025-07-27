
import 'package:flutter/material.dart';
import 'package:net_openx_inventory/core/routing/app_routes.dart';

class NetOpenXApp extends StatelessWidget {
  const NetOpenXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: 'NetOpenX Inventory',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}