import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
extension AppResource on BuildContext {

  AppLocalizations getStrings() {
      var stringRes = AppLocalizations.of(this);
      return stringRes! ;
  }


}
extension ContextExtension on BuildContext {
  T? getArguments<T>(){
    return ModalRoute.of(this)!.settings.arguments as T;
  }

  Locale getLocal() {

    Locale myLocale = Localizations.localeOf(this);
    return myLocale;
  }

  bool isRTL()=>getLocal().languageCode=='ar';
}
extension StringInLine on String {
  String addCurrency(BuildContext context) {
    var stringRes = 'SAR';
    return '$this $stringRes' ;
  }


}
extension NullOrEmpty on String? {
  bool isNullOrEmpty() {
    return this == null || this!.trim().isEmpty ;
  }


}