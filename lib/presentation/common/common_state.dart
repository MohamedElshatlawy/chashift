import 'package:rxdart/subjects.dart';

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

abstract class StreamState<T> {
  dynamic error;
  bool get hasError;
  bool get hasData;
  T? data;

  final _streamController = BehaviorSubject<T>();
  Stream<T> get stream => _streamController.stream;

  setError(dynamic initError) {
    error = initError;
    _streamController.addError(initError);
    data = null;
  }

  setData(T initData) {
    data = initData;
    _streamController.add(initData);
    error = null;
  }

  close() {
    _streamController.close();
  }
}

class StreamStateInitial<T> extends StreamState<T> {
  @override
  // TODO: implement hasData
  bool get hasData => data != null;

  @override
  // TODO: implement hasError
  bool get hasError => error != null;
}

class SuccessState extends CommonState {
  final dynamic successResponse;
  SuccessState(this.successResponse);
}
