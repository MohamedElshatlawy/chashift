// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resume _$ResumeFromJson(Map<String, dynamic> json) {
  return Resume(
    id: json['id'] as int?,
    phoneNumber: json['phoneNumber'] as String?,
    whatsAppNumber: json['whatsAppNumber'] as String?,
    cityId: json['cityId'] as int?,
    idNumber: json['idNumber'] as String?,
    birthDateString: json['birthDateString'] as String?,
    qualificationId: json['qualificationId'] as int?,
    length: json['length'] as int?,
    wieght: json['wieght'] as int?,
    englishLevel: json['englishLevel'] as int?,
    computerLevel: json['computerLevel'] as int?,
    idBank: json['idBank'] as String?,
    gender: json['gender'] as bool?,
  )
    ..cityName = json['cityName'] as String?
    ..qualificationName = json['qualificationName'] as String?
    ..englishLevelName = json['englishLevelName'] as String?
    ..computerLevelName = json['computerLevelName'] as String?
    ..genderName = json['genderName'] as String?;
}

Map<String, dynamic> _$ResumeToJson(Resume instance) => <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'whatsAppNumber': instance.whatsAppNumber,
      'cityId': instance.cityId,
      'cityName': instance.cityName,
      'idNumber': instance.idNumber,
      'birthDateString': instance.birthDateString,
      'qualificationId': instance.qualificationId,
      'qualificationName': instance.qualificationName,
      'length': instance.length,
      'wieght': instance.wieght,
      'englishLevel': instance.englishLevel,
      'computerLevel': instance.computerLevel,
      'englishLevelName': instance.englishLevelName,
      'computerLevelName': instance.computerLevelName,
      'idBank': instance.idBank,
      'genderName': instance.genderName,
      'gender': instance.gender,
    };
