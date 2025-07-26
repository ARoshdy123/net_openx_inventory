
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
