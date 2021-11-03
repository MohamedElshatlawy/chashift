import 'package:json_annotation/json_annotation.dart'; 

part 'resume.g.dart'; 
/*  "phoneNumber": "string",
    "whatsAppNumber": "string",
    "cityName": "string",
    "idNumber": "string",
    "birthDateString": "string",
    "qualificationName": "string",
    "length": 0,
    "wieght": 0,
    "englishLevelName": "string",
    "computerLevelName": "string",
    "idBank": "string",
    "gender": "string"*/
@JsonSerializable(ignoreUnannotated: false)
class Resume {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'phoneNumber')
  final  String? phoneNumber;
  @JsonKey(name: 'whatsAppNumber')
  final  String? whatsAppNumber;
  @JsonKey(name: 'cityId')
  final  int? cityId;
  @JsonKey(name: 'cityName')
  String? cityName;
  @JsonKey(name: 'idNumber')
  final  String? idNumber;
  @JsonKey(name: 'birthDateString')
  final  String? birthDateString;
  @JsonKey(name: 'qualificationId')
  final  int? qualificationId;
  @JsonKey(name: 'qualificationName')
    String? qualificationName;
  @JsonKey(name: 'length')
  final  int? length;
  @JsonKey(name: 'wieght')
  final  int? wieght;
  @JsonKey(name: 'englishLevel')
  final  int? englishLevel;
  @JsonKey(name: 'computerLevel')
  final  int? computerLevel;
  @JsonKey(name: 'englishLevelName')
  String? englishLevelName;
  @JsonKey(name: 'computerLevelName')
  String? computerLevelName;
  @JsonKey(name: 'idBank')
  final  String? idBank;
  @JsonKey(name: 'genderName')
    String? genderName;
  @JsonKey(name: 'gender')
  final   bool? gender;

  Resume({this.id, this.phoneNumber, this.whatsAppNumber, this.cityId, this.idNumber, this.birthDateString, this.qualificationId, this.length, this.wieght, this.englishLevel, this.computerLevel, this.idBank ,this.gender});

  factory Resume.fromJson(Map<String, dynamic> json) => _$ResumeFromJson(json);

  Map<String, dynamic> toJson() => _$ResumeToJson(this);
}

