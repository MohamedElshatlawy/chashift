import 'package:json_annotation/json_annotation.dart'; 

part 'start_shift_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class StartShiftParams {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'startTimeLatitude')
  final  String? startTimeLatitude;
  @JsonKey(name: 'startTimeLongtude')
  final  String? startTimeLongtude;

  StartShiftParams({this.id, this.startTimeLatitude, this.startTimeLongtude});

  factory StartShiftParams.fromJson(Map<String, dynamic> json) => _$StartShiftParamsFromJson(json);

  Map<String, dynamic> toJson() => _$StartShiftParamsToJson(this);
}

