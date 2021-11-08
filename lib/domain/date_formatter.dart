import 'package:intl/intl.dart';

class DateFormatter{
  static const DAY_MONTH_YEAR ='dd/MM/yyyy' ;
  static const HOUR_MINUT_SEC ='HH:mm:ss' ;
  static const DATE_TIME ='dd/MM/yyyy HH:mm:ss' ;

 static String formatDate(DateTime dateTime ,String pattern){
    return DateFormat(pattern).format(dateTime);

  }
  static String formatDateString(date , String pattern ,String newPattern){
    DateTime tempDate = DateFormat(pattern).parse(date);
    String newDate = DateFormat(newPattern).format(tempDate);
    return newDate;

  }
  static DateTime dateFromString(date , {String pattern = DATE_TIME}){
    DateTime tempDate = DateFormat(pattern).parse(date);
    return tempDate;
  }


  static int differenceTwoDatesByMinutes(DateTime start , DateTime end){
   final milliSec = end.millisecond-start.millisecond;
   var sec = milliSec/1000;
   var minute = sec/60;
   return minute .toInt();
  }
  static int differenceNowByMinutes(DateTime start ){
    DateTime end = DateTime.now();
   final milliSec = end.millisecondsSinceEpoch-start.millisecondsSinceEpoch;
   var sec = milliSec/1000;
   var minute = sec/60;
   print('differenceNowByMinutes ${end.millisecondsSinceEpoch} - ${start.millisecondsSinceEpoch} = $milliSec');
   return minute .toInt();
  }

  static int differenceNowBySecond(DateTime start ){
    DateTime end = DateTime.now();
   final milliSec = end.millisecondsSinceEpoch-start.millisecondsSinceEpoch;
   var sec = milliSec/1000;
   print('differenceNowByMinutes ${end.millisecondsSinceEpoch} - ${start.millisecondsSinceEpoch} = $sec');
   return sec.toInt();
  }

}