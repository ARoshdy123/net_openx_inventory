import 'package:json_annotation/json_annotation.dart';
part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  final String netUser    ;
  final String netPassword;
  final String dbName     ;
  final String dbUser     ;
  final String dbPassword ;
  final String branchCode ;
  LoginRequestBody({
    required this.netUser,
    required this.netPassword,
    required this.dbName,
    required this.dbUser,
    required this.dbPassword,
    required this.branchCode,});
  factory LoginRequestBody.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);

}
