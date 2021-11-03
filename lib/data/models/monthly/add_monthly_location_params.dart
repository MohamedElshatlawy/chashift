import 'package:json_annotation/json_annotation.dart'; 

part 'add_monthly_location_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AddMonthlyLocationParams {
  @JsonKey(name: 'longtude')
  final  double? longtude;
  @JsonKey(name: 'latitude')
  final  double? latitude;
  @JsonKey(name: 'houseName')
  final  String? houseName;
  @JsonKey(name: 'departmentNumber')
  final  String? departmentNumber;
  @JsonKey(name: 'buildingNumber')
  final  String? buildingNumber;
  @JsonKey(name: 'locationName')
  final  String? locationName;

  AddMonthlyLocationParams({this.longtude, this.latitude, this.houseName, this.departmentNumber, this.buildingNumber, this.locationName});

  factory AddMonthlyLocationParams.fromJson(Map<String, dynamic> json) => _$AddMonthlyLocationParamsFromJson(json);

  Map<String, dynamic> toJson() => _$AddMonthlyLocationParamsToJson(this);
}

