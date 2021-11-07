import 'package:shiftapp/domain/job_offer.dart';
import 'package:shiftapp/domain/applied_offer.dart';
import 'package:shiftapp/presentation/common/common_state.dart';
class OverviewComponents {
  final List<JobOffer> offers ;
  final List<AppliedOffer> appliedOffers;
  final StreamState<AppliedOffer>  currentShift ;
  OverviewComponents(this.offers, this.appliedOffers, {required this.currentShift});
}