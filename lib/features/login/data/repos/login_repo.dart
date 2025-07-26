
import 'package:net_openx_inventory/core/networking/api_error_handler.dart';
import 'package:net_openx_inventory/core/networking/api_result.dart';
import 'package:net_openx_inventory/features/login/data/data_sources/login_api_service.dart';
import 'package:net_openx_inventory/features/login/data/models/login_request_body.dart';
import 'package:net_openx_inventory/features/login/data/models/login_response_body.dart';

class LoginRepo {
  final LoginApiService _loginApiService;
  LoginRepo(this._loginApiService);

  Future<ApiResult<LoginResponseBody>> login(
      LoginRequestBody loginRequestBody,
      ) async {
    try {
      final response = await _loginApiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
