import 'package:shiftapp/domain/level_item.dart';
import 'package:shiftapp/domain/qualification_item.dart';
import 'package:shiftapp/domain/city_item.dart';
import 'package:shiftapp/domain/resume.dart';
class ResumeComponentData{
  final List<LevelItem> levels ;
  final List<CityItem> cities ;
  final Resume resume ;
  final List<QualificationItem> qualifications ;

  ResumeComponentData(this.levels,this.cities, this.resume , this.qualifications);
}