import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shiftapp/data/models/auth/change_password_params.dart';
import 'package:shiftapp/data/repositories/profile/profile_repository.dart';
import 'package:shiftapp/data/repositories/user/user_repository.dart';
import 'package:shiftapp/presentation/common/common_state.dart';
import '../index.dart';
import 'dart:developer' as developer;
part 'profile_event.dart';

class ProfileBloc extends Bloc<ProfileEvent, CommonState> {
  final UserRepository _userRepository;
  final ProfileRepository _profileRepository;
  ProfileBloc(UserRepository userRepository, this._profileRepository)
      : _userRepository = userRepository,
        super(UnInitState());

  @override
  Stream<CommonState> mapEventToState(
    ProfileEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoginBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
