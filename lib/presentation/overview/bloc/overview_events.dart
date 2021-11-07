part of 'overview_bloc.dart';

@immutable
abstract class OverviewEvents {
  Stream<CommonState> applyAsync(
      {required CommonState currentState,
        required OverviewBloc bloc});
}



class FetchComponentDataEvent extends OverviewEvents {
  FetchComponentDataEvent();

  @override
  Stream<CommonState> applyAsync({required CommonState currentState, required OverviewBloc bloc}) async* {
    yield LoadingState();
    try {
      final response = await bloc._offersRepository.fetchAppliedOpportunities(1);
      final responseOffers = await bloc._offersRepository.fetchOpportunities();
      bloc.fetchCurrentShift();
      yield Initialized(data: OverviewComponents(responseOffers,response,currentShift: bloc.currentShiftState));
    }catch(e,s){
      print(s);
      yield ErrorState(e);

    }
  }

}
