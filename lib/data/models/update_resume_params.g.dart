// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_resume_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateResumeParams _$UpdateResumeParamsFromJson(Map<String, dynamic> json) {
  return UpdateResumeParams(
    id: json['id'] as int?,
    phoneNumber: json['phoneNumber'] as String?,
    whatsAppNumber: json['whatsAppNumber'] as String?,
    cityId: json['cityId'] as int?,
    idNumber: json['idNumber'] as String?,
    birthDateString: json['birthDateString'] as String?,
    qualificationId: json['qualificationId'] as int?,
    length: json['length'] as int?,
    weight: json['wieght'] as int?,
    englishLevel: json['englishLevel'] as int?,
    computerLevel: json['computerLevel'] as int?,
    idBank: json['idBank'] as String?,
  );
}

Map<String, dynamic> _$UpdateResumeParamsToJson(UpdateResumeParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'whatsAppNumber': instance.whatsAppNumber,
      'cityId': instance.cityId,
      'idNumber': instance.idNumber,
      'birthDateString': instance.birthDateString,
      'qualificationId': instance.qualificationId,
      'length': instance.length,
      'wieght': instance.weight,
      'englishLevel': instance.englishLevel,
      'computerLevel': instance.computerLevel,
      'idBank': instance.idBank,
    };
