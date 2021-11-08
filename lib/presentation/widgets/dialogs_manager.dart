// ignore: import_of_legacy_library_into_null_safe
import 'dart:async';
import 'dart:io';

import 'package:ars_dialog/ars_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/data/datasources/remote/api_exception.dart';
import 'package:shiftapp/data/datasources/remote/resume_not_complete_exception.dart';
import 'package:shiftapp/data/exceptions/app_exception.dart';
import 'package:shiftapp/data/repositories/local/local_repository.dart';
import 'package:shiftapp/presentation/common/extensions.dart';
import 'package:shiftapp/presentation/profile/pages/profile_page.dart';
import 'package:shiftapp/presentation/resources/colors.dart';
import 'package:shiftapp/presentation/resources/constants.dart';
import 'package:shiftapp/presentation/resources/resources.dart';
import 'package:shiftapp/presentation/resume/pages/resume_pages.dart';
import 'package:url_launcher/url_launcher.dart';

import 'base_dialog_widget.dart';
import 'material_text.dart';
class DialogsManager {
  static CustomProgressDialog createProgress(BuildContext context) {
    return CustomProgressDialog(context,
        dismissable: false,
        loadingWidget: const CircularProgressIndicator(
          strokeWidth: 2,
        ),
        onDismiss: () {},
        transitionDuration: const Duration(milliseconds: 500),
        backgroundColor: const Color(0x33000000),
        blur: 2,
        dialogTransitionType: DialogTransitionType.Shrink);
  }

  static showLogoutDialog(BuildContext context,
      {required Function onClickOk}) {
    AlertDialog alert = AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            context.getStrings().cancel_button,
            style: kTextBold.copyWith(color: Colors.grey, fontSize: 14),
          ),
        ),
        TextButton(
          onPressed: () {
            onClickOk();

          },
          child: Text(
            context.getStrings().ok_button,
            style: kTextBold.copyWith(color: kFontDarkGreen, fontSize: 14),
          ),
        )
      ],
      content: Container(
        child: Text(
          context.getStrings().logout_message,
          style: kTextSemiBold.copyWith(color: kFontDark, fontSize: 16),
        ),
      ),
    );

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    });
  }

  static handleErrorDialogBuilder(BuildContext context  ,dynamic exception){
    String getErrorMessage() {
      final strings = context.getStrings();
      if (exception is DioError) {
        if (exception.error is WebSocketException || exception.error is HandshakeException ) {
          return context.getStrings().error_internet_connection;
        }
        else if(exception.error is SocketException || exception.error is TimeoutException || exception.error is TimeoutException){
          return context.getStrings().error_internet_connection;
        }
        else if(exception.error is ApiException){
          return exception.message;
        }
        else {
          return context.getStrings().undefine_error;
        }
      }
      if (exception is ApiException) {
        return (exception ).message;
      }
      if (exception is AppException) {

        return context.isRTL()? (exception ).messageAr :(exception ).messageEn;
      }

      if(exception is ResumeNotCompletedException){
        return strings .complete_cv;

      }

      if (exception is SocketException) {
       return strings .error_internet_connection;
      }
      if (exception is WebSocketException || exception is HandshakeException) {
        return strings .error_internet_connection;
      }

      return exception.toString();
    }
    if(exception is ResumeNotCompletedException){
      showErrorDialogWithButton(context ,getErrorMessage());
    }else {
      showErrorDialog(context, getErrorMessage());
    }
  }
  static showErrorDialog(BuildContext context, String text) {
    AlertDialog alert = AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            context.getStrings().ok_button,
            style: kTextBold.copyWith(color: kPrimary, fontSize: 14),
          ),
        )
      ],
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 60,
              child: Image.asset(
                'images/error.gif',
                height: 60,
              ),
            ),
            Text(
              text,
              style: kTextSemiBold.copyWith(color: kFontDark, fontSize: 12),
            ),
          ],
        ),
      ),
    );

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    });
  }
  static showErrorDialogWithButton(BuildContext context, String text) {
    AlertDialog alert = AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            context.getStrings().ok_button,
            style: kTextBold.copyWith(color: Colors.grey, fontSize: 14),
          ),
        )
        ,
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, ResumePages.routeName);
          },
          child: Text(
             context.getStrings().complete_cv,
            style: kTextBold.copyWith(color: kPrimary, fontSize: 14),
          ),
        )
      ],
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 60,
              child: Image.asset(
                'images/error.gif',
                height: 60,
              ),
            ),
            Text(
              text,
              style: kTextSemiBold.copyWith(color: kFontDark, fontSize: 12),
            ),
          ],
        ),
      ),
    );

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    });
  }
  static showCustomDialog(BuildContext context, Widget content) {
   final dialog = showDialog(
        barrierColor: kPrimaryDark.withOpacity(0.7),
        barrierDismissible: false,
        context: context,
        useSafeArea: true,
        builder: (_) => content);


  }



  static showLanguageDialog(BuildContext context,{required Function(AppLocals) onSelectLocal}) {
    AlertDialog alert = AlertDialog(
      title: Text(AppResources.getStrings(context).select_language_title,style: kTextSemiBold,),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(child: const MaterialText('اللغة العربية', padding:const EdgeInsets.only(top: 12,bottom: 12), style: kTextLabel),onTap: (){
              onSelectLocal(AppLocals.AR);
            },),
            const Divider(height: 1,color: kGreyishBrown,),
            InkWell(child: const MaterialText( 'English', style: kTextLabel,
                padding:EdgeInsets.only(top: 12,bottom: 12)
            ),onTap: (){
              onSelectLocal(AppLocals.EN);
            },)
          ],
        ),
      ),
    );

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await showDialog(
        barrierDismissible: true,

        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    });
  }


  static showAskLoginDialog(BuildContext context, {required Function onLogin}) {
    AlertDialog alert = AlertDialog(
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'إلغاء',
            style: kTextBold.copyWith(color: Colors.grey, fontSize: 14),
          ),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
      //      await Navigator.pushNamed(context, LoginPage.routeName);
            onLogin();
          },
          child: Text(
            'تسجيل الدخول',
            style: kTextBold.copyWith(color: kPrimary, fontSize: 14),
          ),
        )
      ],
      content: Container(
        height: 200,
        child: Column(
          children: [
            Container(
              height: 150,
              child: Image.asset('images/error.gif'),
            ),
            Text(
              'يجب تسجيل الدخول اولاً',
              style: kTextSemiBold.copyWith(color: kFontDark, fontSize: 12),
            ),
          ],
        ),
      ),
    );


    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    });
  }

  static showMessageDialog(BuildContext context, String text,
      {required Function onClickOk}) {
    AlertDialog alert = AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (onClickOk != null) {
              onClickOk();
            }
          },
          child: Text(
            context.getStrings().ok_button,
            style: kTextBold.copyWith(color: kPrimaryDark, fontSize: 14),
          ),
        )
      ],
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: kTextSemiBold.copyWith( fontSize: 14),
            ),
            // Container(
            //   height: 150,
            //   child: SvgPicture.asset(Res.ic_checkmark,color: kPrimaryDark,),
            // ),
          ],
        ),
      ),
    );

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    });
  }

 /* static showLogoutDialog(BuildContext context,
      {required Function onClickOk}) {
    AlertDialog alert = AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            context.getStrings().cancel_button,
            style: kTextBold.copyWith(color: Colors.grey, fontSize: 14),
          ),
        ),
        TextButton(
          onPressed: () {
              onClickOk();

          },
          child: Text(
            context.getStrings().ok_button,
            style: kTextBold.copyWith(color: kFontDarkGreen, fontSize: 14),
          ),
        )
      ],
      content: Container(
        child: Text(
        context.getStrings().logout_message,
          style: kTextSemiBold.copyWith(color: kFontDark, fontSize: 16),
        ),
      ),
    );

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    });
  }

  static showInputMessageDialog(BuildContext context, {required Function(String) onClickOk}) {
    String? text ;
    final _formKey = GlobalKey<FormState>();

    AlertDialog alert = AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              onClickOk(text!);
              Navigator.pop(context);
            }
          },
          child: Text(
            'إرسال',
            style: kTextBold.copyWith(color: kPrimary, fontSize: 14),
          ),
        )
      ],
      content: Container(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Please Entry Request Reason'),
            SizedBox(height: 30,),
            Form(
              key: _formKey,
              child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Fill Data';
                  }
                  return null;
                },
                onChanged: (t){
                  text = t ;
                },
                style: kTextBold.copyWith(
                    color: kFontDark, fontSize: 16),
                decoration:InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 70, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                          color: kBordColor, width: 1, style: BorderStyle.solid),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                          color: kBordColor, width: 1, style: BorderStyle.solid),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                          color: kPrimary, width: 1, style: BorderStyle.solid),
                    ))
            ),
              )
          ],
        )
      ),
    );

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    });
  }

  static showMessageImageDialog(BuildContext context, String text, Image image,
      {required Function onClickOk}) {
    AlertDialog alert = AlertDialog(
      actions: [
        FlatButton(
          onPressed: () {
            if (onClickOk != null) {
              onClickOk();
            }
            Navigator.pop(context);
          },
          child: Text(
            context.getStrings().go_it_button,
            style: kTextBold.copyWith(color: kPrimary, fontSize: 14),
          ),
        )
      ],
      content: Container(
        height: 200,
        child: Column(
          children: [
            Text(
              text,
              style: kTextSemiBold.copyWith(color: kPrimary, fontSize: 14),
            ),
            Container(
              height: 150,
              child: image,
            ),
          ],
        ),
      ),
    );

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    });
  }

  static void showNewVersionDialog(CheckOfAppUpdate checkOfAppUpdate, BuildContext context,{required Function onDismiss}) {
    AlertDialog alert = AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            final appPackageName ='com.sedk';
            try {
              launch("market://details?id=" + 'com.sedk');
            } on PlatformException catch(e) {
              launch("https://play.google.com/store/apps/details?id=" + appPackageName);
            } finally {
              launch("https://play.google.com/store/apps/details?id=" + appPackageName);
            }
            Navigator.pop(context);
            onDismiss();
          },
          child: Text(
            context.getStrings().ok_button,
            style: kTextBold.copyWith(color: kPrimaryDark, fontSize: 14),
          ),
        ),
        checkOfAppUpdate.isForceUpdate!=true?TextButton(
          onPressed: () async {
            Navigator.pop(context);
            onDismiss();
          },
          child: Text(
            context.getStrings().not_now,
            style: kTextBold.copyWith(color: kGrey_94, fontSize: 14),

          ),
        ):Container()
      ],
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: SvgPicture.asset(Res.ic_about,color: kPrimaryDark,),
            ),
            Text(
              context.getStrings().new_version_available,
              style: kTextSemiBold.copyWith( fontSize: 14),
            ),

          ],
        ),
      ),
    );

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await showDialog(
        barrierDismissible: checkOfAppUpdate.isForceUpdate!=true,
        useRootNavigator: false,
        context: context,
        builder: (BuildContext context) {

          return  checkOfAppUpdate.isForceUpdate==true ?WillPopScope(
              onWillPop: () => onBackPress(context), child: alert,):alert;
        },
      );
    });
  }

  static onBackPress(BuildContext context) {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }*/
}
