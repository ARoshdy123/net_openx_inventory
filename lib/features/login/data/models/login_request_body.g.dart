// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestBody _$LoginRequestBodyFromJson(Map<String, dynamic> json) =>
    LoginRequestBody(
      netUser: json['netUser'] as String,
      netPassword: json['netPassword'] as String,
      dbName: json['dbName'] as String,
      dbUser: json['dbUser'] as String,
      dbPassword: json['dbPassword'] as String,
      branchCode: json['branchCode'] as String,
    );

Map<String, dynamic> _$LoginRequestBodyToJson(LoginRequestBody instance) =>
    <String, dynamic>{
      'netUser': instance.netUser,
      'netPassword': instance.netPassword,
      'dbName': instance.dbName,
      'dbUser': instance.dbUser,
      'dbPassword': instance.dbPassword,
      'branchCode': instance.branchCode,
    };
