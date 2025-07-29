import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:net_openx_inventory/core/helpers/shared_pref_helper.dart';
import 'package:net_openx_inventory/core/networking/dio_factory.dart';
import 'package:net_openx_inventory/features/login/data/models/login_request_body.dart';
import 'package:net_openx_inventory/features/login/data/repos/login_repo.dart';
import 'package:net_openx_inventory/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  void emitLoginState(String netsisUser, String netsisPassword, String dbName, String dbUser, String dbPassword , String branchCode ) async {
    // Emit loading state
    emit(const LoginState.loading());
    final response = await _loginRepo.login(LoginRequestBody(netUser: netsisUser, netPassword: netsisPassword, dbName: dbName, dbUser: dbUser, dbPassword: dbPassword, branchCode: branchCode));
debugPrint('state is $state');
    response.when(
      success: (loginResponse) async {
        await saveUserToken(loginResponse.accessToken);
        // Emit success state with data
        emit(LoginState.success(loginResponse));
        debugPrint('state is suc $state');
      },
      failure: (errorHandler) {
        emit(LoginState.error(errorHandler.apiErrorModel.message ?? ''));
        debugPrint('state is err $state');
      },
    );
  }

  Future<void> saveUserToken(String accessToken) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken,accessToken);
    debugPrint('Token saved: $accessToken');
    DioFactory.setToken(accessToken);
  }

}
