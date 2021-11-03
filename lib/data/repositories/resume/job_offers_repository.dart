import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shiftapp/data/datasources/remote/api/resume_api_provider.dart';
import 'package:shiftapp/data/models/update_resume_params.dart';
import 'package:shiftapp/domain/qualification_item.dart';
import 'package:shiftapp/domain/level_item.dart';
import 'package:shiftapp/domain/resume.dart';
import 'package:shiftapp/domain/city_item.dart';
class ResumeRepository {

  final ResumeAPI api;

  ResumeRepository(this.api);

  Future<List<LevelItem>> fetchAllLevels() async {
    final response = await api.fetchLevels();
    return response.payload!;
  }

  Future<List<CityItem>> fetchAllCities() async {
    final response = await api.fetchAllCities();
    return response.payload!;
  }

  Future<List<QualificationItem>> fetchQualifications() async {
    final response = await api.fetchQualifications();
    return response.payload!;
  }

  Future<String> updateResume(UpdateResumeParams updateResumeParams) async {
    final response = await api.updateResume(updateResumeParams);
    return response.message!;
  }
  Future<Resume> fetchResume() async {
    final response = await api.fetchResume();
    return response.payload!;
  }

}
