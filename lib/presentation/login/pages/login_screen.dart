import 'package:ars_dialog/ars_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:koin/koin.dart';
import 'package:koin_flutter/koin_flutter.dart';
import 'package:shiftapp/data/models/auth/login_params.dart';
import 'package:shiftapp/presentation/resources/colors.dart';
import 'package:shiftapp/presentation/resources/constants.dart';
import 'package:shiftapp/presentation/resources/validation.dart';
import 'package:shiftapp/presentation/signup/pages/signup_page.dart';
import 'package:shiftapp/presentation/widgets/app_button.dart';
import 'package:shiftapp/presentation/widgets/base_dialog_widget.dart';
import 'package:shiftapp/presentation/widgets/base_widget.dart';
import 'package:shiftapp/presentation/widgets/dialogs_manager.dart';
import 'package:shiftapp/presentation/widgets/material_text_field.dart';

class LoginScreen extends BaseWidget {
  final Function(LoginParams) performLogin;
  String? email;
  String? password;
  String? fcmToken;

  LoginScreen({Key? key, required this.performLogin}) : super(key: key);

  getFcmToken() {
    FirebaseMessaging.instance.getToken().then((token) {
      fcmToken = token ;
      print("FCM TOKEN IS  $token"); // Print the Token in Console
    });

  }


  @override
  Widget buildWidget(BuildContext context) {
    getFcmToken();
    return createUI(context);
  }

  Widget createUI(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.center,
                child: Text(
                  strings.login_title,
                  style: kTextBold.copyWith(fontSize: 24),
                )),
            const SizedBox(
              height: 32,
            ),
            MaterialTextField(
              inputDecoration: kTextFieldDecoration.copyWith(hintText: strings.email),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty || !Validation.isEmailValid(value)) {
                  return strings.invalid_email;
                }
                return null;
              },
              onChanged: (t) {
                email = t;
              },
            ),
            const SizedBox(
              height: 18,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return strings.invalid_password;
                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onChanged: (e) {
                password = e;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: kTextFieldDecoration.copyWith(hintText: strings.password),
            ),
            const SizedBox(
              height: 18,
            ),
            AppButton(
              text: strings.login_button,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  performLogin(
                      LoginParams(email: email, password: password, appId: fcmToken));
                }
              },
            ),
            TextButton(onPressed: (){
              Navigator.pushNamed(context, SignupPage.routeName);
            }, child: Text(strings.dont_have_acount,style: kTextSemiBold.copyWith(fontSize: 15),))
          ],
        ),
      ),
    );
  }
}
