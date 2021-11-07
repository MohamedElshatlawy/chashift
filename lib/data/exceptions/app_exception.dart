import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class AppException implements Exception {
   String  get messageEn;
   String  get messageAr;

   @override
  String toString() {
     final  lang = Get.locale!.languageCode.toString() ;
     return  lang == "ar" ?messageAr : messageEn ;
  }
}
