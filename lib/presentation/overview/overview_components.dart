import 'package:shiftapp/domain/job_offer.dart';
import 'package:shiftapp/domain/applied_offer.dart';
class OverviewComponents {
  final List<JobOffer> offers ;
  final List<AppliedOffer> appliedOffers;

  OverviewComponents(this.offers, this.appliedOffers);
}