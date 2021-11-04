import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shiftapp/data/models/api_response.dart';
import 'package:shiftapp/data/models/auth/change_password_params.dart';

import '../remote_constants.dart';

part 'profile_api_provider.g.dart';

@RestApi(baseUrl: kBASE_URL)
abstract class ProfileAPI {
  factory ProfileAPI(Dio dio) = _ProfileAPI;

  /*@GET('/UserProfile/GetProfileData')
  Future<ApiResponse<ProfileData>> fetchProfile();

  @POST('/UserProfile/ChangePassword')
  Future<ApiResponseNoPayload> changePassword(@Body() ChangePasswordParams changePasswordParams);
*/
  @MultiPart()
  @POST('/FreeLancerInfo/UploadFreelancerProfileImage')
  Future<ApiResponse<String>> uploadProfilePhoto(
      @Part(name: 'file') File image);

  @POST('/FreeLancerInfo/UpdatePasswordFreelancer')
  Future<ApiResponse> updatePassword(
      @Body() ChangePasswordParams updatePasswordParams);
}
