import 'package:dio/dio.dart';
import 'package:net_openx_inventory/core/networking/api_constants.dart';
import 'package:net_openx_inventory/features/login/data/models/login_request_body.dart';
import 'package:net_openx_inventory/features/login/data/models/login_response_body.dart';
import 'package:retrofit/retrofit.dart';
part 'login_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class LoginApiService {
  factory LoginApiService(Dio dio) = _LoginApiService;

  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponseBody> login(@Body() LoginRequestBody loginRequestBody);
}
