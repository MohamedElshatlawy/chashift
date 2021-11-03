
import 'package:shiftapp/data/datasources/remote/api/auth_api_provider.dart';
import 'package:shiftapp/data/models/auth/login_params.dart';
import 'package:shiftapp/data/models/auth/register_params.dart';
import 'package:shiftapp/data/repositories/user/user_repository.dart';
import 'package:shiftapp/domain/user.dart';

class AuthRepository {
  final AuthAPI loginApi;
  final UserRepository userRepository;
  AuthRepository(this.loginApi, this.userRepository);

  Future<User> login(LoginParams request) async {
    final response = await loginApi.login(request);
    if (response.isSuccessfully()) {
      userRepository.saveUser(response.payload!);
    }
    return response.payload!;
  }

  Future<User> register(RegisterParams request) async {
    final response = await loginApi.register(request);
    if (response.isSuccessfully()) {
      userRepository.saveUser(response.payload!);
    }
    return response.payload!;
  }
}
