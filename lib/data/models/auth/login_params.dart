import 'package:json_annotation/json_annotation.dart'; 

part 'login_params.g.dart'; 
/*
* {
  "email": "ahmed@yahoo.com",
  "password": "ahmed",
  "appId": "string"
}*/
@JsonSerializable(ignoreUnannotated: false)
class LoginParams {
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'password')
  String? password;
  @JsonKey(name: 'appId')
  String? appId;

  LoginParams({this.email, this.password, this.appId});

  factory LoginParams.fromJson(Map<String, dynamic> json) => _$LoginParamsFromJson(json);

  Map<String, dynamic> toJson() => _$LoginParamsToJson(this);
}

