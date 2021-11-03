import 'dart:async';
import 'dart:convert';
import 'package:built_value/built_value.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftapp/data/datasources/local/constants.dart';
import 'package:shiftapp/domain/user.dart';
class UserRepository {
  final SharedPreferences? preferences;
  final key = LocalConstants.USER_KEY;

  UserRepository({this.preferences});

  saveUser(User user) {
    final json = jsonEncode(user.toJson());
    preferences!.setString(key, json);
  }

  updateUser(User user) {
    user.token = getAccessToken();
    final json = jsonEncode(user.toJson());
    preferences!.setString(key, json);
  }

  bool isLogged() {
    return preferences!.containsKey(key);
  }

  Stream<User?> getUserStream() async* {
    final userJson = preferences!.getString(key);
    if(userJson!=null) {
      final user = User.fromJson(jsonDecode(userJson));
      yield user;
    }else {
      yield null ;
    }
  }

  clearUser() {
    preferences!.clear();
  }

  @nullable
  User? getUser() {
    final userJson = preferences!.getString(key);
    if (userJson != null) {
      final user = User.fromJson(jsonDecode(userJson));

      return user;
    } else {
      return null;
    }
  }


  @nullable
  String getAccessToken() {
    final userJson = preferences!.getString(key);
    if (userJson != null) {
      final user = User.fromJson(jsonDecode(userJson));

      return user.token!;
    } else {
      return '';
    }
  }
}
