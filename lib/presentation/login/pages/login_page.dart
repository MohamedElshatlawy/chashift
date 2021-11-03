import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shiftapp/presentation/common/common_state.dart';
import 'package:shiftapp/presentation/home/home.dart';
import 'package:shiftapp/presentation/login/bloc/login_bloc.dart';
import 'package:shiftapp/main_index.dart';
import 'package:shiftapp/presentation/widgets/dialogs_manager.dart';
import 'login_screen.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';


  static Future<bool> startWithResult(BuildContext context) async {
    final result   = await Navigator.pushNamed(context, LoginPage.routeName);
    return result ==true;
  }
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    final bloc = getKoin().get<LoginBloc>();

    final progress = DialogsManager.createProgress(context);
    return Scaffold(
      body: BlocListener(
          bloc: bloc,
          listener: (BuildContext context, state) {
            if(state is LoadingState){
              progress.show();
            }
            if(state is Initialized){
              progress.dismiss();
              Navigator.pushNamedAndRemoveUntil(context, MyHomePage.routeName , (route) => true);
            }
            if(state is ErrorState){
              progress.dismiss();
              DialogsManager.handleErrorDialogBuilder(context, state.error);
            }
            },
      child: LoginScreen(performLogin: (loginParams ) { bloc.add(LoginAccountEvent(loginParams)); },)),
    );
  }
}
