import 'package:ars_dialog/ars_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:koin/koin.dart';
import 'package:flutter/material.dart';

import 'package:koin_flutter/koin_flutter.dart';
import 'package:shiftapp/data/models/auth/login_params.dart';
import 'package:shiftapp/data/models/auth/register_params.dart';
import 'package:shiftapp/presentation/common/extensions.dart';
import 'package:shiftapp/presentation/resources/colors.dart';
import 'package:shiftapp/presentation/resources/constants.dart';
import 'package:shiftapp/presentation/resources/validation.dart';
import 'package:shiftapp/presentation/widgets/app_button.dart';
import 'package:shiftapp/presentation/widgets/base_dialog_widget.dart';
import 'package:shiftapp/presentation/widgets/base_widget.dart';
import 'package:shiftapp/presentation/widgets/dialogs_manager.dart';
import 'package:shiftapp/presentation/widgets/material_text_field.dart';

class SignupScreen extends BaseWidget {
  final Function(RegisterParams) performLogin;
  String? email;
  String? nameAr;
  String? nameEn;
  bool isMale = true;
  String? password;
  String? fcmToken;

  SignupScreen({Key? key, required this.performLogin}) : super(key: key);

  getFcmToken() {
     FirebaseMessaging.instance.getToken().then((token) {
      fcmToken = token ;
      print("FCM TOKEN IS  $token"); // Print the Token in Console
    });

  }

  @override
  Widget buildWidget(BuildContext context) {
    getFcmToken();
    CustomProgressDialog progressDialog =
        DialogsManager.createProgress(context);
    return createUI(context);
  }

  Widget createUI(BuildContext context) {
    FocusNode focusNode = FocusNode();
    TextEditingController controller = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    strings.register_title,
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
                height: 16,
              ),
              MaterialTextField(
                inputDecoration: kTextFieldDecoration.copyWith(hintText: strings.name_ar),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty ) {
                    return strings.invalid_ar_name;
                  }
                  return null;
                },
                onChanged: (t) {
                  nameAr = t;
                },
              ),
              const SizedBox(
                height: 18,
              ),
              MaterialTextField(
                inputDecoration: kTextFieldDecoration.copyWith(hintText: strings.name_en),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty ) {
                    return strings.invalid_en_name;
                  }
                  return null;
                },
                onChanged: (t) {
                  nameEn = t;
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

               SelectGender(onSelect: (value ) {
                 isMale = value == Gender.Male;
               },),
              const SizedBox(
                height: 18,
              ),
              AppButton(
                text: strings.register,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    performLogin(
                        RegisterParams(email: email, password: password,gender: isMale,nameAr: nameAr,nameEn: nameEn,appId: fcmToken));
                  }
                },
              ),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text(strings.have_account,style: kTextSemiBold.copyWith(fontSize: 15),))
            ],
          ),
        ),
      ),
    );
  }
}


class SelectGender extends StatefulWidget {
  final Function(Gender) onSelect;
   final Gender?  initValue ;
    const SelectGender({Key? key, required this.onSelect ,  this.initValue}) : super(key: key);

  @override
  _SelectGenderState createState() {
    return _SelectGenderState();
  }
}

enum Gender { Male,Female }

class _SelectGenderState extends State<SelectGender> {
  Gender ? selectedBrand ;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    selectedBrand ??= widget.initValue!=null ?widget.initValue!:Gender.Male;

    final strings = context.getStrings();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          strings.gender,
          style: kTextBold.copyWith(color: kFontDarkGreen, fontSize: 16),
        ),
        Card(
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: RadioListTile(
                      dense: true,
                        activeColor: kPrimary,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        value: Gender.Male,
                        title: Text(
                          strings.male,
                          style: kTextSemiBold.copyWith(fontSize: 14),
                        ),
                        groupValue: selectedBrand,
                        onChanged: (s) {
                          selectedBrand = s as Gender;
                          widget.onSelect(selectedBrand!);

                          setState(() {});
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: RadioListTile(
                        activeColor: kPrimary,

                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        value: Gender.Female,
                        title: Text(
                          strings.female ,
                          style: kTextSemiBold.copyWith(fontSize: 14),
                        ),
                        groupValue: selectedBrand,
                        onChanged: (s) {
                          selectedBrand = s as Gender;
                          setState(() {});
                        }),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}

