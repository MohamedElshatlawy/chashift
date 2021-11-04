import 'dart:developer';
import 'dart:io';

import 'package:shiftapp/data/datasources/remote/api/profile_api_provider.dart';
import 'package:shiftapp/data/models/auth/change_password_params.dart';

class ProfileRepository {
  final ProfileAPI _api;

  ProfileRepository(this._api);
/*
  Future<ProfileData> fetch() async {
    final response = await _api.fetchProfile();
    return response.payload!;
  }*/

  Future<String> uploadPhoto(File file) async {
    final response = await _api.uploadProfilePhoto(file);
    return response.message!;
  }

  Future<String> changePassword(ChangePasswordParams params) async {
    final response = await _api.updatePassword(params);
    // log('get response data = ${response.');
    return response.message!;
  }
}
