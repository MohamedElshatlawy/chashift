import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shiftapp/data/models/api_response.dart';
import 'package:shiftapp/data/models/update_resume_params.dart';
import 'package:shiftapp/domain/level_item.dart';
import 'package:shiftapp/domain/qualification_item.dart';
import '../remote_constants.dart';
import 'package:shiftapp/domain/resume.dart';
import 'package:shiftapp/domain/city_item.dart';
part 'resume_api_provider.g.dart';

@RestApi(baseUrl: kBASE_URL)
abstract class ResumeAPI {
  factory ResumeAPI(Dio dio) = _ResumeAPI;


  @POST('/FreeLancerInfo/UpdateFreeLancerCV')
  Future<ApiResponse<Resume>> updateResume(@Body() UpdateResumeParams updateResumeParams);

  @GET('/FreeLancerInfo/GetFreeLanceLoginCV')
  Future<ApiResponse<Resume>> fetchResume();

  @GET('/FreeLancerInfo/GetAllLevels')
  Future<ApiResponse<List<LevelItem>>> fetchLevels();

  @GET('/City/GetAllCities')
  Future<ApiResponse<List<CityItem>>> fetchAllCities();

  @GET('/Qualification/GetAllQualificationForDrop')
  Future<ApiResponse<List<QualificationItem>>> fetchQualifications();
}
