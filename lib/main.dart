
import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftapp/data/repositories/local/local_repository.dart';
import 'package:shiftapp/presentation/appliedoffers/pages/appliedoffers_pages.dart';
import 'package:shiftapp/presentation/home/home.dart';
import 'package:shiftapp/presentation/login/pages/login_page.dart';
import 'package:shiftapp/presentation/profile/index.dart';
import 'package:shiftapp/presentation/resume/pages/resume_pages.dart';
import 'package:shiftapp/presentation/settings/settings_screen.dart';
import 'package:shiftapp/presentation/signup/pages/signup_page.dart';
import 'package:shiftapp/presentation/splash/pages/splash_page.dart';
import 'package:shiftapp/presentation/widgets/restart_app_widget.dart';
import 'package:shiftapp/utils/notification.dart';

import 'data/datasources/local/sharedprefrence.dart';
import 'data/datasources/remote/logger/app_loogers.dart';
import 'di/remote_module.dart';
import 'main_index.dart';


import 'dart:async';


/// Create a [AndroidNotificationChannel] for heads up notifications
AndroidNotificationChannel? channel;

FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp();
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  AppLoggers.setupLogger();

  final myModule = Module();
  myModule
    ..single((s) => SharedPreferenceAPP(_prefs))
    ..single((scope) => _prefs);
  asyncStartKoin((app) {
    app.modules([myModule, remoteModule, appModule, blocsModule]);
  });

  // HttpOverrides.global = new MyHttpOverrides();


 FirebaseMessaging.onBackgroundMessage(kFirebaseMessagingBackgroundHandler);

  kInitMessagingHandler();

  runApp( const RestartWidget(child: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localRepo = getKoin().get<LocalRepository>();
    kInitMessageNotifier(context, localRepo.getLocal());

    return  GetMaterialApp(
      theme: ThemeData(
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: const MaterialColor(
            0xff6869E4,
            <int, Color>{
              50: Color(0xffffffff),
              100: Color(0xffffffff),
              200: Color(0xffffffff),
              300: Color(0xffffffff),
              400: Color(0xffffffff),
              500: Color(0xffffffff),
              600: Color(0xffffffff),
              700: Color(0xffffffff),
              800: Color(0xffffffff),
              900: Color(0xffffffff),
            },
          ),
          focusColor: Colors.amber),
      locale:  Locale(localRepo.getLocal()),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('ar', ''), // Arabic, no country code
      ],
      routes: routes,
      initialRoute: SplashScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}

Future onSelectNotification(payload) async {
  Map valueMap = json.decode(payload);

  print('onSelectNotification ${valueMap}');
  final type = valueMap.containsKey('type') ? valueMap['type']:'';
  final referenceId = valueMap.containsKey('referenceId') ? valueMap['referenceId']:'';




}

final routes = {
  LoginPage.routeName: (context) => LoginPage(),
  MyHomePage.routeName: (context) => const MyHomePage(),
  ProfilePage.routeName: (context) =>  ProfilePage(),
  AppliedOffersPage.routeName: (context) => const AppliedOffersPage(hasBar: true,),
  ResumePages.routeName: (context) =>  ResumePages(),
  SettingsScreen.routeName: (context) =>  SettingsScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  SignupPage.routeName: (context) => SignupPage(),
};




