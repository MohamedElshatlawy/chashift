import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koin_flutter/src/widget_extension.dart';
import 'package:shiftapp/domain/resume.dart';
import 'package:shiftapp/presentation/common/common_state.dart';
import 'package:shiftapp/presentation/resume/bloc/resume_bloc.dart';
import 'package:shiftapp/presentation/resume/bloc/resume_component_data.dart';
import 'package:shiftapp/presentation/widgets/app_widgets.dart';
import 'package:shiftapp/presentation/widgets/base_widget.dart';
import 'package:shiftapp/presentation/widgets/dialogs_manager.dart';
import 'package:shiftapp/presentation/widgets/error_handler_widget.dart';
import 'package:shiftapp/presentation/widgets/loading_widget.dart';

import 'resume_screen.dart';

class ResumePages extends BaseWidget {
  static const routeName = '/cv';

  ResumePages({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context) {

    final bloc = getKoin().get<ResumeBloc>();
    final progress = DialogsManager.createProgress(context);
    bloc.add(FetchComponentDataEvent());
    return  Scaffold(
        appBar: kAppBar(context,title: strings.resume),
        body: BlocBuilder(
          bloc: bloc,
          buildWhen: (c,state){
            return state is Initialized<ResumeComponentData> || state is  LoadingState || state is  ErrorState  ;
          },
          builder: (BuildContext context, state) {
          if(state is LoadingState){
            return LoadingView();
          }

          if(state is Initialized<ResumeComponentData>){
            return BlocListener(
              bloc: bloc,
              listener: (BuildContext context, state) {
                if(state is LoadingDialogState){
                  progress.show();
                }
                if(state is Initialized<String>){
                  progress.dismiss();
                  DialogsManager.showMessageDialog(context, state.data, onClickOk: (){
                    Navigator.pop(context);
                  });
                }
                if(state is ErrorDialogState){
                  progress.dismiss();
                }
              },
              child: ResumeScreen(resumeComponentData: state.data, onPerformUpdate: (updateResumeParams ) {
                bloc.add(UpdateResumeEvent(updateResumeParams));
              },),
            );
          }

          if(state is ErrorState){
            return ErrorPlaceHolderWidget(exception: state.error,);
          }
          return Center();
        },)
    );
  }
}