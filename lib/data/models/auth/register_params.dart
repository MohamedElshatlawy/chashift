import 'package:json_annotation/json_annotation.dart'; 

part 'register_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class RegisterParams {
  @JsonKey(name: 'nameEn')
  final  String? nameEn;
  @JsonKey(name: 'nameAr')
  final  String? nameAr;
  @JsonKey(name: 'email')
  final  String? email;
  @JsonKey(name: 'password')
  final  String? password;
  @JsonKey(name: 'gender')
  final  bool? gender;
  @JsonKey(name: 'appId')
  String? appId;

  RegisterParams({this.nameEn, this.nameAr, this.email, this.password, this.gender,this.appId});

  factory RegisterParams.fromJson(Map<String, dynamic> json) => _$RegisterParamsFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterParamsToJson(this);
}

