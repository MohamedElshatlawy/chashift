
part of 'resume_bloc.dart';

@immutable
abstract class ResumeEvent {
  Stream<CommonState> applyAsync(
      {required CommonState currentState,
        required ResumeBloc bloc});

}

class FetchComponentDataEvent extends ResumeEvent {

  @override
  Stream<CommonState> applyAsync({required CommonState currentState, required ResumeBloc bloc}) async* {
    try {
      yield LoadingState();
      final responseLevels = await bloc._resumeRepository.fetchAllLevels();
      final responseCities = await bloc._resumeRepository.fetchAllCities();
      final responseResume = await bloc._resumeRepository.fetchResume();
      final responseQualifications =await  bloc._resumeRepository.fetchQualifications();
      yield Initialized(data: ResumeComponentData(responseLevels,responseCities,responseResume,responseQualifications));
    } catch (e, s) {
      print(s);
      yield ErrorState(e);
    }
  }

}

class UpdateResumeEvent extends ResumeEvent {

  final UpdateResumeParams updateResumeParams ;

  UpdateResumeEvent(this.updateResumeParams);
  @override
  Stream<CommonState> applyAsync({required CommonState currentState, required ResumeBloc bloc}) async* {
    try {
      yield LoadingDialogState();
      final response = await bloc._resumeRepository.updateResume(updateResumeParams);
      yield Initialized(data: response);
    } catch (e, s) {
      print(s);
      yield ErrorDialogState(e);
    }
  }

}