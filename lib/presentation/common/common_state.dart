
abstract class CommonState {
  CommonState();
}

/// UnInitialized
class UnInitState extends CommonState {}
class LoadingState extends CommonState {}
class LoadingDialogState extends CommonState {}
class ProfileNotCompletedState extends CommonState {}
class UnAuthorizedState extends CommonState {}
class FinishedState extends CommonState {}
class FinishedDialogState extends CommonState {}


/// Initialized
class Initialized<T> extends CommonState {
  T data;
  Initialized({
    required this.data,
  });
}

class ErrorState extends CommonState {
  final dynamic error;
  ErrorState(this.error);

}

class ErrorDialogState extends CommonState {
  final dynamic error;
  ErrorDialogState(this.error);
}
