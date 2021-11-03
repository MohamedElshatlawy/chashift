import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shiftapp/data/models/api_response.dart';
import 'package:shiftapp/data/models/auth/login_params.dart';
import 'package:shiftapp/data/models/auth/register_params.dart';
import '../remote_constants.dart';
import 'package:shiftapp/domain/user.dart';
part 'auth_api_provider.g.dart';

@RestApi(baseUrl: kBASE_URL)
abstract class AuthAPI {
  factory AuthAPI(Dio dio) = _AuthAPI;


  @POST('/FreeLancerInfo/Login')
  Future<ApiResponse<User>> login(@Body() LoginParams loginParams);

  @POST('/FreeLancerInfo/PostRegisterUserFreeLancer')
  Future<ApiResponse<User>> register(@Body() RegisterParams loginParams);
}
