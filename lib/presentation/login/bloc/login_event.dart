part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  Stream<CommonState> applyAsync(
      {required CommonState currentState,
      required LoginBloc bloc});
}


class LoginAccountEvent extends LoginEvent {
  final LoginParams  loginParams ;

  LoginAccountEvent(this.loginParams) : super();

  @override
  Stream<CommonState> applyAsync({required CommonState currentState, required LoginBloc bloc}) async* {
    yield LoadingState();
    try {
      final response = await bloc._loginRepository.login(loginParams);
      yield Initialized(data: response);
    }catch(e){
      yield ErrorState(e);

    }
  }

}
class RegisterEvent extends LoginEvent {
  final RegisterParams  loginParams ;

  RegisterEvent(this.loginParams) : super();

  @override
  Stream<CommonState> applyAsync({required CommonState currentState, required LoginBloc bloc}) async* {
    yield LoadingState();
    try {
      final response = await bloc._loginRepository.register(loginParams);
      yield Initialized(data: response);
    }catch(e){
      yield ErrorState(e);

    }
  }

}
