import 'package:flutter/material.dart';
import 'package:net_openx_inventory/core/di/dependency_injection.dart';
import 'package:net_openx_inventory/core/helpers/shared_pref_helper.dart';
import 'package:net_openx_inventory/core/networking/dio_factory.dart';
import 'package:net_openx_inventory/net_openx.dart';

void main() async {
  setupGetIt();


  WidgetsFlutterBinding.ensureInitialized();
  await checkIfLoggedInUser();

  runApp(const NetOpenXApp());
}


Future<void> checkIfLoggedInUser() async {
  String? userToken =
  await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (userToken == null || userToken.isEmpty) {
    DioFactory.setToken(userToken!);
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}