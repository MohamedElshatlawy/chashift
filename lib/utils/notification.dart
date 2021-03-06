import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shiftapp/main.dart';
import 'package:awesome_notifications/awesome_notifications.dart' as aw;
import 'package:awesome_notifications/awesome_notifications.dart' ;


const CONFIRM_CHANNEL_KEY = "confirmation_shift";
const CONFIRM_GROUP_KEY ="confirmation_shift_group";

requestNotificationPermission(){
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      // Insert here your friendly dialog box before call the request method
      // This is very important to not harm the user experience
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
}
initAwesNotif(){
  AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
      'resource://drawable/logo',
      [
        NotificationChannel(
          channelKey: CONFIRM_CHANNEL_KEY,
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          ledColor: Colors.white,
          channelShowBadge: true,
          groupKey: CONFIRM_GROUP_KEY,
          groupSort: aw.GroupSort.Asc,
          groupAlertBehavior: aw.GroupAlertBehavior.Children,
          importance: NotificationImportance.High,

        )
      ]
  );

  AwesomeNotifications().actionStream.listen(
          (receivedNotification){

            print('on CLICK NOTIFICATION ${receivedNotification.title}');
  }
  );
}

void showAWNotification(){
  AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: Random().nextInt(100),
          channelKey: 'mshbasic_channel',
          title: 'Simple Notification',
          body: 'hi every body',
        groupKey: CONFIRM_GROUP_KEY,
        displayOnForeground: true,
        showWhen: true,
        autoDismissable: false,
        displayOnBackground: true,
      ),
    actionButtons: [
      NotificationActionButton(key: 'key', label: 'Confirm',buttonType: ActionButtonType.KeepOnTop,)
    ]
  );
}
void kShowNotification(){
  flutterLocalNotificationsPlugin!.show(
    1,
    'notification.title',
    'notification.body',

    NotificationDetails(
      android: AndroidNotificationDetails(
          channel!.id,
          channel!.name,
          channelShowBadge: true,
          channelDescription: channel?.description,
         usesChronometer: true,
          largeIcon:DrawableResourceAndroidBitmap('logo'),
        //  add a proper drawable resource to android, for now using
        //      one that already exists in example app.
      ),
    ),
    );
}

Future<void> kFirebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}


  kInitMessagingHandler() async {

  initAwesNotif();
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'Shiftcash_channel', // id
        'High Importance Notifications', // title
        description:  'This channel is used for Shiftcash notifications.', // description
        importance: Importance.high,
      );

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      var initializationSettingsAndroid =
      AndroidInitializationSettings('drawable/logo');

      const IOSInitializationSettings initializationSettingsIOS =
      const IOSInitializationSettings(
          requestSoundPermission: false,
          requestBadgePermission: false,
          requestAlertPermission: false);

      final InitializationSettings initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS);



      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      if(Platform.isAndroid) {
        await flutterLocalNotificationsPlugin!
            .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
            ?.createNotificationChannel(channel!);
      }else if (Platform.isIOS){
        await flutterLocalNotificationsPlugin!
            .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
            ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
      }

      await flutterLocalNotificationsPlugin!.initialize(initializationSettings,onSelectNotification: onSelectNotification);


      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }
  Future<void> kInitMessageNotifier(BuildContext context,String local) async {



    FirebaseMessaging.instance
        .getInitialMessage()
        .then((value) => {print('ON MESSAGES FCM ALL${value.toString()}')});

    if (kIsWeb) {
    } else

    if (Platform.isAndroid) {
      FirebaseMessaging.instance.subscribeToTopic('allandroid');
      FirebaseMessaging.instance.setAutoInitEnabled(true);
      FirebaseMessaging.instance.subscribeToTopic('all').then((value) =>
          print('SUBSCRUB DONE SUBSCRUB'),onError: (e){
        print('SUBSCRUB ON ERROR SUBSCRIP ${e.toString()}');
      });
      if (local == 'en') {
        FirebaseMessaging.instance.subscribeToTopic("english");
        FirebaseMessaging.instance.unsubscribeFromTopic("arabic");

        FirebaseMessaging.instance.subscribeToTopic("englishandroid");
        FirebaseMessaging.instance.unsubscribeFromTopic("arabicandroid");
      } else {
        FirebaseMessaging.instance.subscribeToTopic("arabic");
        FirebaseMessaging.instance.unsubscribeFromTopic("english");

        FirebaseMessaging.instance.subscribeToTopic("arabicios");
        FirebaseMessaging.instance.unsubscribeFromTopic("englishandroid");
      }
    } else if (Platform.isIOS) {
      // iOS-specific code
      FirebaseMessaging.instance.subscribeToTopic('allios');
      FirebaseMessaging.instance.setAutoInitEnabled(true);
      FirebaseMessaging.instance.subscribeToTopic('all').then((value) =>
          print('SUBSCRUB DONE SUBSCRUB'),onError: (e){
        print('SUBSCRUB ON ERROR SUBSCRIP ${e.toString()}');
      });
      if (local == 'en') {
        FirebaseMessaging.instance.subscribeToTopic("english");
        FirebaseMessaging.instance.unsubscribeFromTopic("arabic");

        FirebaseMessaging.instance.subscribeToTopic("englishios");
        FirebaseMessaging.instance.unsubscribeFromTopic("arabicios");
      } else {
        FirebaseMessaging.instance.subscribeToTopic("arabic");
        FirebaseMessaging.instance.unsubscribeFromTopic("english");

        FirebaseMessaging.instance.subscribeToTopic("arabicios");
        FirebaseMessaging.instance.unsubscribeFromTopic("englishios");
      }

    }
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      print('ON MESSAGES FCM ${message.notification!.title!}');

      if (notification != null) {
        String valueMap = json.encode(message.data);

        // ignore: avoid_print
        print('ON MESSAGES FCM Data ${message.data} => $valueMap');

        flutterLocalNotificationsPlugin!.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
                channel!.id,
                channel!.name,
                channelDescription: channel?.description,
                largeIcon:DrawableResourceAndroidBitmap('logo')
              //  add a proper drawable resource to android, for now using
              //      one that already exists in example app.
            ),
          ),
          payload: valueMap,);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published! ${message.data}');
      //containsKey('type')?message.data['type']:''
      String valueMap = json.encode(message.data);

      onSelectNotification(valueMap);
    });
  }
  Future onSelectNotification(payload) async {
    Map valueMap = json.decode(payload);

    print('onSelectNotification ${valueMap}');

/*    final type = valueMap.containsKey('type') ? valueMap['type']:'';
    final referenceId = valueMap.containsKey('referenceId') ? valueMap['referenceId']:'';
    //containsKey('type')?message.data['type']:''

    if(type==NotificationsTypes.UpdateAppVersion)
      AppUtils.launchAppLink();
    else if (type==NotificationsTypes.Monthly){
      Navigator.pushNamed(Get.context!, BookingOfferScreen.routeName,arguments: BookingOfferModel(offerId:referenceId ));
    }*/


  }



