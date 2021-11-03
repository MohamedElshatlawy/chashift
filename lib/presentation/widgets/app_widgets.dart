import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/resources/colors.dart';

class AppWidgets{

}
AppBar kAppBar(BuildContext context,
    {String title ='Cashift', bool hasDrawerMenu = true, Function? onClickMenu , bool isMain = false}) {


  // final isMain  = routeName == MainPage.routeName ;
  return AppBar(
    leading: hasDrawerMenu
        ? isMain
        ? IconButton(
        onPressed: () {
          if (onClickMenu != null) {
            onClickMenu();
          }
        },
        icon: const Icon(Icons.menu))
        : IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios_rounded),
      color: Colors.white,
    )
        : Container(),
    elevation: 0,
    centerTitle: true,
    title: Text(title),
    backgroundColor: kPrimary,
  );
}
