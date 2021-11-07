part of 'applied_offers_bloc.dart';

@immutable
abstract class AppliedOffersEvents {
  Stream<CommonState> applyAsync(
      {required CommonState currentState,
        required AppliedOffersBloc bloc});
}



class FetchAppliedOpportunitiesEvent extends AppliedOffersEvents {
  final bool isActiveOffers;
  FetchAppliedOpportunitiesEvent(this.isActiveOffers);

  @override
  Stream<CommonState> applyAsync({required CommonState currentState, required AppliedOffersBloc bloc}) async* {
    yield LoadingState();
    try {
      final response = await bloc._offersRepository.fetchAppliedOpportunities(isActiveOffers?1:2);
      yield Initialized(data: response);
    }catch(e,s){
      print(s);
      yield ErrorState(e);

    }
  }

}

class StartShiftEvent extends AppliedOffersEvents {
  final AppliedOffer appliedOffers;
  final Position position;
  StartShiftEvent(this.appliedOffers, this.position);

  @override
  Stream<CommonState> applyAsync({required CommonState currentState, required AppliedOffersBloc bloc}) async* {
    yield LoadingDialogState();
    try {

      double distanceInMeters = Geolocator.distanceBetween(position.latitude,position.longitude,appliedOffers.latitude!,appliedOffers.longtude!);
      print(' _determinePosition ${position}  =>   meters ${distanceInMeters} > ${appliedOffers.latitude} , ${appliedOffers.longtude} = ${distanceInMeters > int.parse(appliedOffers.radius!)}');

      final date = DateFormatter.dateFromString('${appliedOffers.workingDate} ${appliedOffers.opportunitiesStrartTime}' );
      final minuts = DateFormatter.differenceNowByMinutes(date);
      print('workingDate time ${date} => $minuts}');
      if(distanceInMeters > int.parse(appliedOffers.radius!)){
        print('ErrorDialogState when change');
        yield ErrorDialogState(MistakeShiftLocationExceptions());
      }else
        if(appliedOffers.statusId == OpportunitiesStatus.Accept.index) {
          final response = await bloc._offersRepository.startShift(
              StartShiftParams(id: appliedOffers.id,
                startTimeLatitude: position.latitude.toString(),
                startTimeLongtude: position.longitude.toString(),));
          yield Initialized(data: response);
        }else if (appliedOffers.statusId ==OpportunitiesStatus.Start.index){
          final response = await bloc._offersRepository.finishShift(
              EndShiftParams(id: appliedOffers.id,
                endTimeLatitude: position.latitude.toString(),
                endTimeLongtude: position.longitude.toString(),));
          yield Initialized(data: response);
        }

    }catch(e,s){
      print(s);
      yield ErrorDialogState(e);

    }
  }

}


