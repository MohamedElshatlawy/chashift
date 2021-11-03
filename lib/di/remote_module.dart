import 'package:koin/koin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftapp/data/datasources/remote/api/auth_api_provider.dart';
import 'package:shiftapp/data/datasources/remote/api/job_offers_api_provider.dart';
import 'package:shiftapp/data/datasources/remote/api/profile_api_provider.dart';
import 'package:shiftapp/data/datasources/remote/api/resume_api_provider.dart';
import 'package:shiftapp/data/datasources/remote/base_client.dart';
import 'package:shiftapp/data/repositories/joboffers/job_offers_repository.dart';
import 'package:shiftapp/data/repositories/local/local_repository.dart';
import 'package:shiftapp/data/repositories/login/auth_repository.dart';
import 'package:shiftapp/data/repositories/profile/profile_repository.dart';
import 'package:shiftapp/data/repositories/resume/job_offers_repository.dart';
import 'package:shiftapp/data/repositories/user/user_repository.dart';
import 'package:shiftapp/presentation/appliedoffers/bloc/applied_offers_bloc.dart';
import 'package:shiftapp/presentation/joboffers/bloc/job_offers_bloc.dart';
import 'package:shiftapp/presentation/login/bloc/login_bloc.dart';
import 'package:shiftapp/presentation/overview/bloc/overview_bloc.dart';
import 'package:shiftapp/presentation/profile/bloc/profile_bloc.dart';
import 'package:shiftapp/presentation/resume/bloc/resume_bloc.dart';

import 'di_constants.dart';

final remoteModule = Module()
  ..factory((scope) {
    return HeaderInterceptor(scope.get<UserRepository>(),scope.get<LocalRepository>() );
  })
  ..factory((scope) {
    return ClientCreator(scope.get<HeaderInterceptor>());
  })
  ..factory((scope) => AuthAPI(scope.get<ClientCreator>().create()))
  ..factory((scope) => ProfileAPI(scope.get<ClientCreator>().create()))
  ..factory((scope) => AuthRepository(scope.get(),scope.get()))
  ..factory((scope) => JobOffersAPI(scope.get<ClientCreator>().create()))
  ..factory((scope) => JobOffersRepository(scope.get()))
  ..factory((scope) => ResumeAPI(scope.get<ClientCreator>().create()))
  ..factory((scope) => ProfileRepository(scope.get()))
  ..factory((scope) => ResumeRepository(scope.get<ResumeAPI>()));

final blocsModule = Module()
  ..factory((scope) => LoginBloc(scope.get<AuthRepository>()))
  ..factory((scope) => ProfileBloc(scope.get() , scope.get()))
  ..factory((scope) => ResumeBloc(scope.get()))
  ..factory((scope) => OverviewBloc(scope.get()))
  ..factory((scope) => AppliedOffersBloc(scope.get()))
  ..factory((scope) => JobOffersBloc(scope.get() , scope.get())) ;

final appModule = Module()
  ..single((scope) => UserRepository(preferences: scope.get<SharedPreferences>()))
  ..single((scope) => scope.get<UserRepository>().getUser()?.token, qualifier: StringQualifier(DIConstants.TOKEN_KEY))
  ..single((scope) => LocalRepository(preferences: scope.get<SharedPreferences>()));
