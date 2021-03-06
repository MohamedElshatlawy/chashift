// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applied_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppliedOffer _$AppliedOfferFromJson(Map<String, dynamic> json) {
  return AppliedOffer(
    id: json['id'] as int?,
    statusId: json['statusId'] as int?,
    status: json['status'] as String?,
    radius: json['radius'] as String?,
    opportunitiesStrartTime: json['opportunitiesStrartTime'] as String?,
    opportunitiesEndTime: json['opportunitiesEndTime'] as String?,
    workingDate: json['workingDate'] as String?,
    latitude: (json['latitude'] as num?)?.toDouble(),
    longtude: (json['longtude'] as num?)?.toDouble(),
    jobName: json['jobName'] as String?,
    salary: (json['salary'] as num?)?.toDouble(),
    projectName: json['projectName'] as String?,
    address: json['address'] as String?,
  );
}

Map<String, dynamic> _$AppliedOfferToJson(AppliedOffer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusId': instance.statusId,
      'status': instance.status,
      'radius': instance.radius,
      'opportunitiesStrartTime': instance.opportunitiesStrartTime,
      'opportunitiesEndTime': instance.opportunitiesEndTime,
      'workingDate': instance.workingDate,
      'latitude': instance.latitude,
      'longtude': instance.longtude,
      'jobName': instance.jobName,
      'salary': instance.salary,
      'projectName': instance.projectName,
      'address': instance.address,
    };
