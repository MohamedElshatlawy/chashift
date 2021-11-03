abstract class AppException implements Exception {
   String  get messageEn;
   String  get messageAr;

   @override
  String toString() {
    return messageEn;
  }
}
