// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginParams _$LoginParamsFromJson(Map<String, dynamic> json) {
  return LoginParams(
    email: json['email'] as String?,
    password: json['password'] as String?,
    appId: json['appId'] as String?,
  );
}

Map<String, dynamic> _$LoginParamsToJson(LoginParams instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'appId': instance.appId,
    };
