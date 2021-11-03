import 'package:shiftapp/data/exceptions/app_exception.dart';

class MistakeShiftLocationExceptions  implements AppException {
  @override
  String messageEn  = 'Sorry, you have to go to the job site to get started !' ;
  @override
  String messageAr  = 'Sorry, you have to go to the job site to get started !' ;
  @override
  String toString() {
    return messageEn ;
  }
}
