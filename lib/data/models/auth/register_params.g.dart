// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterParams _$RegisterParamsFromJson(Map<String, dynamic> json) {
  return RegisterParams(
    nameEn: json['nameEn'] as String?,
    nameAr: json['nameAr'] as String?,
    email: json['email'] as String?,
    password: json['password'] as String?,
    gender: json['gender'] as bool?,
  );
}

Map<String, dynamic> _$RegisterParamsToJson(RegisterParams instance) =>
    <String, dynamic>{
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'email': instance.email,
      'password': instance.password,
      'gender': instance.gender,
    };
