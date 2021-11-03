// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'end_shift_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EndShiftParams _$EndShiftParamsFromJson(Map<String, dynamic> json) {
  return EndShiftParams(
    id: json['id'] as int?,
    endTimeLatitude: json['endTimeLatitude'] as String?,
    endTimeLongtude: json['endTimeLongtude'] as String?,
  );
}

Map<String, dynamic> _$EndShiftParamsToJson(EndShiftParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'endTimeLatitude': instance.endTimeLatitude,
      'endTimeLongtude': instance.endTimeLongtude,
    };
