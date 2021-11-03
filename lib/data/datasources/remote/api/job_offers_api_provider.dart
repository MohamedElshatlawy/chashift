import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shiftapp/data/models/api_response.dart';
import 'package:shiftapp/data/models/auth/login_params.dart';
import 'package:shiftapp/data/models/start_shift_params.dart';
import 'package:shiftapp/data/models/end_shift_params.dart';
import '../remote_constants.dart';
import 'package:shiftapp/domain/applied_offer.dart';
import 'package:shiftapp/domain/job_offer.dart';
part 'job_offers_api_provider.g.dart';

@RestApi(baseUrl: kBASE_URL)
abstract class JobOffersAPI {
  factory JobOffersAPI(Dio dio) = _JobOffersAPI;


  @GET('/OpportunitiesAvailble/GetAllOpportunitiesAvailbleForMob')
  Future<ApiResponse<List<JobOffer>>> fetchOpportunities();

  @GET('/OpportunitiesAvailble/CheckFreeLanceApplyOpportunityAvailbleByIdForMob')
  Future<ApiResponse<String>> applyJob(@Query('Id') int id );


  @GET('/FreeLanceApplyOpportunities/GetAllFreeLanceApplyOpportunitiesByStatusIdForMob')
  Future<ApiResponse<List<AppliedOffer>>> fetchAppliedOpportunities(@Query('statusId') int statusId);

  @POST('/FreeLanceApplyOpportunities/StartFreeLanceWork')
  Future<ApiResponse<String>> startShift(@Body() StartShiftParams shiftParams);


  @POST('/FreeLanceApplyOpportunities/EndFreeLanceWork')
  Future<ApiResponse<String>> finishShift(@Body() EndShiftParams shiftParams);


/*  @GET('/OpportunitiesAvailble/CheckFreeLanceApplyOpportunityAvailbleByIdForMob')
  Future<ApiResponse<String>> applyJob(@Query('Id') int id );*/

}
