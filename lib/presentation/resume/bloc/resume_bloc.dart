import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shiftapp/data/models/update_resume_params.dart';
import 'package:shiftapp/data/repositories/resume/job_offers_repository.dart';
import 'package:shiftapp/data/repositories/user/user_repository.dart';
import 'package:shiftapp/presentation/common/common_state.dart';
import 'package:shiftapp/presentation/resume/bloc/resume_component_data.dart';

part 'resume_event.dart';

class ResumeBloc extends Bloc<ResumeEvent, CommonState> {
  final ResumeRepository _resumeRepository ;
  ResumeBloc(ResumeRepository ResumeRepository) : _resumeRepository = ResumeRepository ,  super(UnInitState());

  @override
  Stream<CommonState> mapEventToState(
      ResumeEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      //developer.log('$_', name: 'LoginBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
