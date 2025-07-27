import 'package:json_annotation/json_annotation.dart';
part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponseBody {
  final String message;
  final String accessToken;

  LoginResponseBody({required this.message,
    required this.accessToken,});
  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseBodyToJson(this);

}
