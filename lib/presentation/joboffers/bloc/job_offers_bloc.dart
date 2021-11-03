import 'dart:async';
import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shiftapp/data/datasources/remote/resume_not_complete_exception.dart';
import 'package:shiftapp/data/repositories/joboffers/job_offers_repository.dart';
import 'package:shiftapp/data/repositories/login/auth_repository.dart';
import 'package:shiftapp/data/repositories/user/user_repository.dart';
import 'package:shiftapp/domain/opportunities_status.dart';
import 'package:shiftapp/presentation/common/common_state.dart';
import 'dart:async';
import 'dart:developer' as developer;
import 'package:shiftapp/presentation/common/common_state.dart';
import 'package:shiftapp/presentation/login/bloc/login_bloc.dart';

part 'job_offers_event.dart';

class JobOffersBloc extends Bloc<JobOffersEvent, CommonState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct

   final JobOffersRepository _offersRepository;
   final UserRepository _userRepository;
  JobOffersBloc(this._offersRepository,this._userRepository) : super(UnInitState());


  @override
  Future<void> close() async {
    await super.close();
  }



  @override
  Stream<CommonState> mapEventToState(
    JobOffersEvent event,
  ) async* {
    try {
      yield* event.applyAsync(
          currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'JobOffersBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
