import 'package:json_annotation/json_annotation.dart'; 

part 'job_offer.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class JobOffer {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'jobId')
  final  int? jobId;
  @JsonKey(name: 'opportunitiesStrartTime')
  final  String? opportunitiesStrartTime;
  @JsonKey(name: 'opportunitiesEndTime')
  final  String? opportunitiesEndTime;
  @JsonKey(name: 'latitude')
  final  double? latitude;
  @JsonKey(name: 'longtude')
  final  double? longtude;
  @JsonKey(name: 'jobName')
  final  String? jobName;
  @JsonKey(name: 'salary')
  final  double? salary;
  @JsonKey(name: 'hourSalary')
  final  double? hourSalary;
  @JsonKey(name: 'projectName')
  final  String? projectName;
  @JsonKey(name: 'workingDate')
  final  String? workingDate;
  @JsonKey(name: 'projectAddress')
  final  String? projectAddress;
  @JsonKey(name: 'jobRequirements')
  final  JobRequirements? jobRequirements;

  JobOffer({this.id, this.jobId, this.opportunitiesStrartTime, this.opportunitiesEndTime, this.latitude, this.longtude, this.jobName, this.salary, this.hourSalary, this.projectName, this.workingDate,this.projectAddress, this.jobRequirements});

  factory JobOffer.fromJson(Map<String, dynamic> json) => _$JobOfferFromJson(json);

  Map<String, dynamic> toJson() => _$JobOfferToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class JobRequirements {
  @JsonKey(name: 'projectId')
  final  int? projectId;
  @JsonKey(name: 'ageFrom')
  final  int? ageFrom;
  @JsonKey(name: 'ageTo')
  final  int? ageTo;
  @JsonKey(name: 'gender')
  final  String? gender;
  @JsonKey(name: 'lengthFrom')
  final  int? lengthFrom;
  @JsonKey(name: 'lengthTo')
  final  int? lengthTo;
  @JsonKey(name: 'wieghtFrom')
  final  int? wieghtFrom;
  @JsonKey(name: 'wieghtTo')
  final  int? wieghtTo;
  @JsonKey(name: 'hoursCount')
  final  int? hoursCount;

  JobRequirements({this.projectId, this.ageFrom, this.ageTo, this.gender, this.lengthFrom, this.lengthTo, this.wieghtFrom, this.wieghtTo, this.hoursCount});

  factory JobRequirements.fromJson(Map<String, dynamic> json) => _$JobRequirementsFromJson(json);

  Map<String, dynamic> toJson() => _$JobRequirementsToJson(this);
}

