import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:koin_flutter/koin_flutter.dart';
import 'package:shiftapp/data/repositories/local/local_repository.dart';
import 'package:shiftapp/main.dart';
import 'package:shiftapp/presentation/common/extensions.dart';
import 'package:shiftapp/presentation/resources/colors.dart';
import 'package:shiftapp/presentation/resources/resources.dart';
import 'package:shiftapp/presentation/widgets/app_widgets.dart';
import 'package:shiftapp/presentation/widgets/dialogs_manager.dart';
import 'package:shiftapp/presentation/widgets/material_text.dart';
import 'package:shiftapp/presentation/widgets/restart_app_widget.dart';

class SettingsScreen extends StatelessWidget{
  static const String routeName= '/settings_Screen' ;
  @override
  Widget build(BuildContext context) {
    final localRepo = getKoin().get<LocalRepository>();
    final strings =  AppResources.getStrings(context);
    return Scaffold(
      appBar: kAppBar(context,title: context.getStrings().settings,isMain: false),
      body: SafeArea(child:
        Column(
          children: [
            InkWell(
              child: MaterialText(
        strings.change_language_label,
                mathWidth: true,
                margin: const EdgeInsetsDirectional.only(top: 24,bottom: 12),
                padding: const EdgeInsets.only(left: 8,right: 8),
              startIcon: const Icon(Icons.language,color: kAccent,),
              startIconPadding: const EdgeInsetsDirectional.only(end: 8),
              endIcon:  const Icon(Icons.arrow_forward_ios,color: kAccent,),
              ),
              onTap: (){
                DialogsManager.showLanguageDialog(context,onSelectLocal: (local){
                  Navigator.of(context).pop();
                  localRepo.toggleLanguage();
                  RestartWidget.restartApp(context);
                 });
              },
            ),
            const Divider(height: 1,),

          ],
        ),
      ),
    );
  }


}