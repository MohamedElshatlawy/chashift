// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_shift_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartShiftParams _$StartShiftParamsFromJson(Map<String, dynamic> json) {
  return StartShiftParams(
    id: json['id'] as int?,
    startTimeLatitude: json['startTimeLatitude'] as String?,
    startTimeLongtude: json['startTimeLongtude'] as String?,
  );
}

Map<String, dynamic> _$StartShiftParamsToJson(StartShiftParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTimeLatitude': instance.startTimeLatitude,
      'startTimeLongtude': instance.startTimeLongtude,
    };
