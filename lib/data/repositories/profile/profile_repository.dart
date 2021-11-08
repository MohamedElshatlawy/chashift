import 'dart:io';

import 'package:shiftapp/data/datasources/remote/api/profile_api_provider.dart';
import 'package:shiftapp/data/repositories/user/user_repository.dart';
import 'package:shiftapp/domain/user.dart';


class ProfileRepository {
  final ProfileAPI _api;
  final UserRepository userRepository ;
  ProfileRepository(this._api,this.userRepository);
/*
  Future<ProfileData> fetch() async {
    final response = await _api.fetchProfile();
    return response.payload!;
  }*/


  Future<String> uploadPhoto(File file) async {
    final response = await _api.uploadProfilePhoto(file);
    if(response.isSuccessfully()){
      final user = userRepository.getUser() ;
      user?.profileImagePath = response.payload.toString();
      userRepository.updateUser(user!);
    }
    return response.message!;
  }
/*


  Future<String> changePassword(ChangePasswordParams params) async {
    final response = await _api.changePassword(params);
    return response.message!;
  }
*/


}

