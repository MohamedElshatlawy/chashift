import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

/*
class ChangePasswordScreen extends StatelessWidget {
  static const routeName='/createpassword';

  @override
  Widget build(BuildContext context) {
    final bloc  = getKoin().get<ProfileBloc>();
    final progressDialog = DialogsManager.createProgress(context);
    Widget buildForm(BuildContext context) {
      String ?newPassword;
      String ?oldPassword;

      final _formKey = GlobalKey<FormState>();

      return Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              PasswordTextFiled(
                onChange: (value) {
                  oldPassword = value;
                  print('ON SET NEW PASSWORD $newPassword');
                },
                validator: (value) {
                  if (value==null) {
                    return 'من فضلك قم بإدخال كلمة المرور الحالية ';
                  }
                  return null;
                },
                margin: EdgeInsets.only(right: 22, left: 22, top: 24),
                hintText: 'كلمة المرور الحالية',
              ),
              PasswordTextFiled(
                onChange: (value) {
                  newPassword = value;
                  print('ON SET NEW PASSWORD $newPassword');
                },
                validator: (value) {
                  if (value==null) {
                    return 'من فضلك قم بإدخال كلمة السر الجديدة';
                  }
                  return null;
                },
                margin: EdgeInsets.only(right: 22, left: 22, top: 24),
                hintText: 'كلمة المرور الجديدة',
              ),
              PasswordTextFiled(
                validator: (value) {
                  if (value != newPassword) {
                    return 'من فضلك قم بإدخال كلمة المرور متطابقة';
                  }
                  return null;
                },
                margin: EdgeInsets.only(right: 22, left: 22, top: 24),
                hintText: 'تأكيد كلمة المرور ',
              ),
              AppButton(
                margin: EdgeInsets.only(left: 22, right: 22, top: 32),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    bloc.add(ChangePasswordEvent(ChangePasswordParams(
                        newPassword: newPassword,
                        currentPassword: oldPassword)));
                    kHideKeyboard();

                  }

                },
                text: 'إرسال',
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: kBuildAppBar(context, title: 'Change password'),
      body: BlocProvider(
          create: (BuildContext context) {
            return bloc;
          },
          child: BlocListener<ProfileBloc, CommonState>(
            bloc: bloc,
            listener: (context, state) {
              print('BlocListener STATE ${state}');
              if (state is LoadingDialogState) {
                progressDialog.show();
              }
              if (state is SuccessState) {
                progressDialog.dismiss();

                DialogsManager.showMessageDialog(context, state.data, onClickOk: (){
                  Navigator.pop(context);
                });
              }
              if (state is ErrorDialogState) {
                progressDialog.dismiss();
                DialogsManager.showErrorDialog(context, state.toString());
              }
            },
            child: buildForm(context),
          )),
    );


  }


}
*/
