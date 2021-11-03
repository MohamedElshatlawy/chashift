// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qualification_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QualificationItem _$QualificationItemFromJson(Map<String, dynamic> json) {
  return QualificationItem(
    id: json['id'] as int?,
    qualificationName: json['qualificationName'] as String?,
  );
}

Map<String, dynamic> _$QualificationItemToJson(QualificationItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'qualificationName': instance.qualificationName,
    };
