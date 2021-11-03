import 'package:json_annotation/json_annotation.dart'; 

part 'update_resume_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class UpdateResumeParams {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'phoneNumber')
  final  String? phoneNumber;
  @JsonKey(name: 'whatsAppNumber')
  final  String? whatsAppNumber;
  @JsonKey(name: 'cityId')
  final  int? cityId;
  @JsonKey(name: 'idNumber')
  final  String? idNumber;
  @JsonKey(name: 'birthDateString')
  final  String? birthDateString;
  @JsonKey(name: 'qualificationId')
  final  int? qualificationId;
  @JsonKey(name: 'length')
  final  int? length;
  @JsonKey(name: 'wieght')
  final  int? weight;
  @JsonKey(name: 'englishLevel')
  final  int? englishLevel;
  @JsonKey(name: 'computerLevel')
  final  int? computerLevel;
  @JsonKey(name: 'idBank')
  final  String? idBank;

  UpdateResumeParams({this.id, this.phoneNumber, this.whatsAppNumber, this.cityId, this.idNumber, this.birthDateString, this.qualificationId, this.length, this.weight, this.englishLevel, this.computerLevel, this.idBank});

  factory UpdateResumeParams.fromJson(Map<String, dynamic> json) => _$UpdateResumeParamsFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateResumeParamsToJson(this);
}

