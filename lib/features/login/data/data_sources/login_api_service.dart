import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'login_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class LoginApiService {
  factory LoginApiService(Dio dio) = _LoginApiService;

  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponseBody> login(@Body() LoginRequestBody loginRequestBody);
}
