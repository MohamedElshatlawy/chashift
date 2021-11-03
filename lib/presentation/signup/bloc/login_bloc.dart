import 'dart:async';
import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:shiftapp/data/repositories/login/auth_repository.dart';
import 'package:shiftapp/presentation/common/common_state.dart';
import 'dart:async';
import 'dart:developer' as developer;
import 'package:meta/meta.dart';
import 'package:shiftapp/data/models/auth/login_params.dart';
import 'package:shiftapp/presentation/common/common_state.dart';
import 'package:shiftapp/presentation/login/bloc/login_bloc.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, CommonState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct

   final AuthRepository _loginRepository;

  LoginBloc(this._loginRepository) : super(UnInitState());

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }



  @override
  Stream<CommonState> mapEventToState(
    LoginEvent event,
  ) async* {
    try {
      yield* event.applyAsync(
          currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoginBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
