import 'package:json_annotation/json_annotation.dart';
import 'package:shiftapp/data/datasources/remote/remote_constants.dart';

part 'user.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class User {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'name')
  final  String? name;
  @JsonKey(name: 'profileImagePath')
    String? profileImagePath;
  @JsonKey(name: 'isCompeleteProfile')
  final  bool? isCompeleteProfile;
  @JsonKey(name: 'email')
  final  String? email;
  @JsonKey(name: 'token')
    String? token;

  User({this.id, this.name, this.profileImagePath, this.isCompeleteProfile, this.email, this.token});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  String getImagePath(){
    return '$kServerUrl$profileImagePath';
  }
}

