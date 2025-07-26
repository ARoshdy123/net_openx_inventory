import 'package:flutter/material.dart';
import 'package:net_openx_inventory/core/di/dependency_injection.dart';
import 'package:net_openx_inventory/net_openx.dart';

void main() async {
  setupGetIt();


  WidgetsFlutterBinding.ensureInitialized();

  runApp(const NetOpenXApp());
}


// Future<void> checkIfLoggedInUser() async {
//   String? userToken =
//   await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
//   if (!userToken.isNullOrEmpty()) {
//     DioFactory.setToken(userToken!);
//     isLoggedInUser = true;
//   } else {
//     isLoggedInUser = false;
//   }
// }