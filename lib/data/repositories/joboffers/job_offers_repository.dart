import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shiftapp/data/datasources/remote/api/job_offers_api_provider.dart';
import 'package:shiftapp/domain/job_offer.dart';
import 'package:shiftapp/data/models/start_shift_params.dart';
import 'package:shiftapp/data/models/end_shift_params.dart';
import 'package:shiftapp/domain/applied_offer.dart';
class JobOffersRepository {

  final JobOffersAPI api;

  JobOffersRepository(this.api);

  Future<List<JobOffer>> fetchOpportunities() async {
    final response = await api.fetchOpportunities();
    return response.payload!;
  }


  Future<List<AppliedOffer>> fetchAppliedOpportunities(int statusId) async {
    final response = await api.fetchAppliedOpportunities(statusId);
    return response.payload!;
  }

  Future<String> applyOpportunities(int id) async {
    final response = await api.applyJob(id);
    return response.message!;
  }
  Future<String> startShift(StartShiftParams shiftParams) async {
    final response = await api.startShift(shiftParams);
    return response.message!;
  }

  Future<String> finishShift(EndShiftParams shiftParams) async {
    final response = await api.finishShift(shiftParams);
    return response.message!;
  }

  Future<AppliedOffer?> fetchCurrentShift() async {
    final response = await api.fetchCurrentShift();
    return response.payload;
  }

}
