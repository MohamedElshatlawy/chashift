// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_monthly_location_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddMonthlyLocationParams _$AddMonthlyLocationParamsFromJson(
    Map<String, dynamic> json) {
  return AddMonthlyLocationParams(
    longtude: (json['longtude'] as num?)?.toDouble(),
    latitude: (json['latitude'] as num?)?.toDouble(),
    houseName: json['houseName'] as String?,
    departmentNumber: json['departmentNumber'] as String?,
    buildingNumber: json['buildingNumber'] as String?,
    locationName: json['locationName'] as String?,
  );
}

Map<String, dynamic> _$AddMonthlyLocationParamsToJson(
        AddMonthlyLocationParams instance) =>
    <String, dynamic>{
      'longtude': instance.longtude,
      'latitude': instance.latitude,
      'houseName': instance.houseName,
      'departmentNumber': instance.departmentNumber,
      'buildingNumber': instance.buildingNumber,
      'locationName': instance.locationName,
    };
