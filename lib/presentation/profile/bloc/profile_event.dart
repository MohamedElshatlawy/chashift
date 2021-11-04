part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {
  Stream<CommonState> applyAsync(
      {required CommonState currentState, required ProfileBloc bloc});
}

class FetchProfile extends ProfileEvent {
  @override
  Stream<CommonState> applyAsync(
      {required CommonState currentState, required ProfileBloc bloc}) async* {
    try {
      yield LoadingState();
      final response = bloc._userRepository.getUser();
      print('FetchProfile ${response!.name!}');
      yield Initialized(data: response);
    } catch (e, s) {
      print(s);
      yield ErrorState(e);
    }
  }
}

class LogoutEvent extends ProfileEvent {
  @override
  Stream<CommonState> applyAsync(
      {required CommonState currentState, required ProfileBloc bloc}) async* {
    bloc._userRepository.clearUser();
  }
}

class UpdateProfileImage extends ProfileEvent {
  final File file;

  UpdateProfileImage(this.file);

  @override
  List<Object?> get props => [];

  @override
  Stream<CommonState> applyAsync(
      {required CommonState currentState, required ProfileBloc bloc}) async* {
    try {
      yield LoadingDialogState();
      final response = await bloc._profileRepository.uploadPhoto(file);
      bloc.add(FetchProfile());
    } catch (e, s) {
      print('ON ERROR DIALOG STATE ${e}');
      yield ErrorDialogState(e);
    }
  }
}

class ChangePasswordEvent extends ProfileEvent {
  final ChangePasswordParams passwordParams;

  ChangePasswordEvent(this.passwordParams);

  @override
  List<Object?> get props => [passwordParams];

  @override
  Stream<CommonState> applyAsync(
      {required CommonState currentState, required ProfileBloc bloc}) async* {
    try {
      yield LoadingDialogState();
      final response =
          await bloc._profileRepository.changePassword(passwordParams);
      yield SuccessState(response);
      print('ON SuccessState DIALOG STATE ');
    } catch (e, s) {
      print('ON ErrorDialogState DIALOG STATE ');
      yield ErrorDialogState(e);
    }
  }
}
