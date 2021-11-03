part of 'job_offers_bloc.dart';

@immutable
abstract class JobOffersEvent {
  Stream<CommonState> applyAsync(
      {required CommonState currentState,
      required JobOffersBloc bloc});
}


class FetchOffersEvent extends JobOffersEvent {


  @override
  Stream<CommonState> applyAsync({required CommonState currentState, required JobOffersBloc bloc}) async* {
    yield LoadingState();
    try {
      final response = await bloc._offersRepository.fetchOpportunities();
      yield Initialized(data: response);
    }catch(e,s){
      print('ERROR STATE ${s.toString()}');
      yield ErrorState(e);

    }
  }

}

class ApplyOpportunitiesEvent extends JobOffersEvent {
 final  int id ;
  ApplyOpportunitiesEvent(this.id);

  @override
  Stream<CommonState> applyAsync({required CommonState currentState, required JobOffersBloc bloc}) async* {
    yield LoadingDialogState();
    try {
      if(bloc._userRepository.getUser()!.isCompeleteProfile==true) {
        final response = await bloc._offersRepository.applyOpportunities(id);
        yield Initialized(data: response);
      }else{
        yield ErrorDialogState(ResumeNotCompletedException());
      }
    }catch(e,s){
      print('ErrorDialogState'+ s.toString());
      yield ErrorDialogState(e);
    }
  }

}

class FetchAppliedOpportunitiesEvent extends JobOffersEvent {

  @override
  Stream<CommonState> applyAsync({required CommonState currentState, required JobOffersBloc bloc}) async* {
    yield LoadingState();
    try {
        final response = await bloc._offersRepository.fetchAppliedOpportunities(1);
        yield Initialized(data: response);
    }catch(e,s){
      print(s);
      yield ErrorState(e);

    }
  }

}
