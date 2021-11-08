import 'package:json_annotation/json_annotation.dart';
import 'package:shiftapp/domain/date_formatter.dart';

part 'applied_offer.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AppliedOffer {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'statusId')
  final  int? statusId;
  @JsonKey(name: 'status')
  final  String? status;
  @JsonKey(name: 'radius')
  final  String? radius;
  @JsonKey(name: 'opportunitiesStrartTime')
  final  String? opportunitiesStrartTime;
  @JsonKey(name: 'opportunitiesEndTime')
  final  String? opportunitiesEndTime;
  @JsonKey(name: 'workingDate')
  final  String? workingDate;
  @JsonKey(name: 'latitude')
  final  double? latitude;
  @JsonKey(name: 'longtude')
  final  double? longtude;
  @JsonKey(name: 'jobName')
  final  String? jobName;
  @JsonKey(name: 'salary')
  final  double? salary;
  @JsonKey(name: 'projectName')
  final  String? projectName;
  @JsonKey(name: 'address')
  final  String? address;

  AppliedOffer({this.id , this.statusId, this.status, this.radius, this.opportunitiesStrartTime, this.opportunitiesEndTime, this.workingDate, this.latitude, this.longtude, this.jobName, this.salary, this.projectName, this.address});

  factory AppliedOffer.fromJson(Map<String, dynamic> json) => _$AppliedOfferFromJson(json);

  Map<String, dynamic> toJson() => _$AppliedOfferToJson(this);

  String startTime(){
    return DateFormatter.formatDateString(opportunitiesStrartTime, DateFormatter.HOUR_MINUT_SEC ,'HH:mm');
  }
  String finishTime(){
    return DateFormatter.formatDateString(opportunitiesEndTime, DateFormatter.HOUR_MINUT_SEC ,'HH:mm');
  }

  DateTime finishedDateTime(){
    final date = DateFormatter.dateFromString('${workingDate} ${opportunitiesEndTime}' );
    print('DATE NOW ${DateTime.now()}');
    print('fetchfinishedDateTime $date');

    //  final remainingTime = DateFormatter.differenceNowByMinutes(date);
    return date ;
  }

  int remainingTimeFinish(){
    finishedDateTime();
    final date = DateFormatter.dateFromString('${workingDate} ${opportunitiesEndTime}' );
    return DateFormatter.differenceNowBySecond(date);
  }

}

