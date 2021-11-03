import 'dart:async';
import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shiftapp/data/datasources/remote/resume_not_complete_exception.dart';
import 'package:shiftapp/data/exceptions/mistake_shift_location_exception.dart';
import 'package:shiftapp/data/repositories/joboffers/job_offers_repository.dart';
import 'package:shiftapp/data/repositories/login/auth_repository.dart';
import 'package:shiftapp/data/repositories/user/user_repository.dart';
import 'package:shiftapp/domain/applied_offer.dart';
import 'package:shiftapp/domain/opportunities_status.dart';
import 'package:shiftapp/presentation/common/common_state.dart';
import 'dart:async';
import 'dart:developer' as developer;
import 'package:shiftapp/presentation/common/common_state.dart';
import 'package:shiftapp/presentation/login/bloc/login_bloc.dart';
import 'package:shiftapp/data/models/start_shift_params.dart';
import 'package:shiftapp/data/models/end_shift_params.dart';

part 'applied_offers_events.dart';

class AppliedOffersBloc extends Bloc<AppliedOffersEvents, CommonState> {
  // use GetIt for DI in projct

  final JobOffersRepository _offersRepository;
  AppliedOffersBloc(this._offersRepository) : super(UnInitState());


  @override
  Future<void> close() async {
    await super.close();
  }



  @override
  Stream<CommonState> mapEventToState(
      AppliedOffersEvents event,
      ) async* {
    try {
      yield* event.applyAsync(
          currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'AppliedOffersBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }

}
