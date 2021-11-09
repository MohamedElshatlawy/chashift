import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koin_flutter/src/widget_extension.dart';
import 'package:shiftapp/data/models/auth/change_password_params.dart';
import 'package:shiftapp/presentation/common/common_state.dart';
import 'package:shiftapp/presentation/profile/index.dart';
import 'package:shiftapp/presentation/widgets/app_button.dart';
import 'package:shiftapp/presentation/widgets/dialogs_manager.dart';
import 'package:shiftapp/presentation/widgets/material_text_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const routeName = '/createpassword';

  @override
  Widget build(BuildContext context) {
    final bloc = getKoin().get<ProfileBloc>();
    final progressDialog = DialogsManager.createProgress(context);
    Widget buildForm(BuildContext context) {
      String? newPassword;
      String? oldPassword;

      final _formKey = GlobalKey<FormState>();

      return Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MaterialTextField(
                onChanged: (value) {
                  oldPassword = value;
                  print('ON SET NEW PASSWORD $newPassword');
                },
                validator: (value) {
                  if (value == null) {
                    return 'من فضلك قم بإدخال كلمة المرور الحالية ';
                  }
                  return null;
                },
                margin: const EdgeInsets.only(right: 22, left: 22, top: 24),
                inputDecoration: const InputDecoration(
                  hintText: 'كلمة المرور الحالية',
                ),
              ),
              MaterialTextField(
                onChanged: (value) {
                  newPassword = value;
                  print('ON SET NEW PASSWORD $newPassword');
                },
                validator: (value) {
                  if (value == null) {
                    return 'من فضلك قم بإدخال كلمة السر الجديدة';
                  }
                  return null;
                },
                margin: const EdgeInsets.only(right: 22, left: 22, top: 24),
                inputDecoration: const InputDecoration(
                  hintText: 'كلمة المرور الجديدة',
                ),
              ),
              MaterialTextField(
                validator: (value) {
                  if (value != newPassword) {
                    return 'من فضلك قم بإدخال كلمة المرور متطابقة';
                  }
                  return null;
                },
                margin: const EdgeInsets.only(right: 22, left: 22, top: 24),
                inputDecoration: const InputDecoration(
                  hintText: 'تأكيد كلمة المرور ',
                ),
              ),
              AppButton(
                margin: const EdgeInsets.only(left: 22, right: 22, top: 32),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    bloc.add(ChangePasswordEvent(ChangePasswordParams(
                      oldPassword: oldPassword,
                      newPassword: newPassword,
                    )));
                    // kHideKeyboard();

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
      // appBar: kBuildAppBar(context, title: 'Change password'),
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
                DialogsManager.showMessageDialog(
                    context, state.successResponse.toString(), onClickOk: () {
                  state.successResponse == 'Infromation is Saved'
                      ? Navigator.pop(context)
                      : null;
                });
              }
              if (state is ErrorDialogState) {
                progressDialog.dismiss();
                DialogsManager.showErrorDialog(context, state.error.toString());
              }
            },
            child: buildForm(context),
          )),
    );
  }
}
