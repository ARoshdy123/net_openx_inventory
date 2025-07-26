import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:net_openx_inventory/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  void emitLoginState() async {
    // Emit loading state
    emit(LoginState.loading());
    final response = await _loginRepo.login(LoginRequestBody());

    response.when(
      success: (data) {
        // Emit success state with data
        emit(LoginState.success(data));
      },
      failure: (errorHandler) {
        emit(LoginState.error(errorHandler.apiErrorModel.message ?? ''));
      },
    );
  }
}
