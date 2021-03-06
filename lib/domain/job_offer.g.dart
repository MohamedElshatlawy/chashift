// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobOffer _$JobOfferFromJson(Map<String, dynamic> json) {
  return JobOffer(
    id: json['id'] as int?,
    jobId: json['jobId'] as int?,
    opportunitiesStrartTime: json['opportunitiesStrartTime'] as String?,
    opportunitiesEndTime: json['opportunitiesEndTime'] as String?,
    latitude: (json['latitude'] as num?)?.toDouble(),
    longtude: (json['longtude'] as num?)?.toDouble(),
    jobName: json['jobName'] as String?,
    salary: (json['salary'] as num?)?.toDouble(),
    hourSalary: (json['hourSalary'] as num?)?.toDouble(),
    projectName: json['projectName'] as String?,
    workingDate: json['workingDate'] as String?,
    projectAddress: json['projectAddress'] as String?,
    jobRequirements: json['jobRequirements'] == null
        ? null
        : JobRequirements.fromJson(
            json['jobRequirements'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JobOfferToJson(JobOffer instance) => <String, dynamic>{
      'id': instance.id,
      'jobId': instance.jobId,
      'opportunitiesStrartTime': instance.opportunitiesStrartTime,
      'opportunitiesEndTime': instance.opportunitiesEndTime,
      'latitude': instance.latitude,
      'longtude': instance.longtude,
      'jobName': instance.jobName,
      'salary': instance.salary,
      'hourSalary': instance.hourSalary,
      'projectName': instance.projectName,
      'workingDate': instance.workingDate,
      'projectAddress': instance.projectAddress,
      'jobRequirements': instance.jobRequirements,
    };

JobRequirements _$JobRequirementsFromJson(Map<String, dynamic> json) {
  return JobRequirements(
    projectId: json['projectId'] as int?,
    ageFrom: json['ageFrom'] as int?,
    ageTo: json['ageTo'] as int?,
    gender: json['gender'] as String?,
    lengthFrom: json['lengthFrom'] as int?,
    lengthTo: json['lengthTo'] as int?,
    wieghtFrom: json['wieghtFrom'] as int?,
    wieghtTo: json['wieghtTo'] as int?,
    hoursCount: json['hoursCount'] as int?,
  );
}

Map<String, dynamic> _$JobRequirementsToJson(JobRequirements instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'ageFrom': instance.ageFrom,
      'ageTo': instance.ageTo,
      'gender': instance.gender,
      'lengthFrom': instance.lengthFrom,
      'lengthTo': instance.lengthTo,
      'wieghtFrom': instance.wieghtFrom,
      'wieghtTo': instance.wieghtTo,
      'hoursCount': instance.hoursCount,
    };
