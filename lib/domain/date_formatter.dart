import 'package:intl/intl.dart';

class DateFormatter{
  static const DAY_MONTH_YEAR ='dd/MM/yyyy' ;

 static String formatDate(DateTime dateTime ,String pattern){
    return DateFormat(pattern).format(dateTime);

  }
  static String formatDateString(date , String pattern ,String newPattern){
    DateTime tempDate = DateFormat(pattern).parse(date);
    String newDate = DateFormat(newPattern).format(tempDate);
    return newDate;

  }
}