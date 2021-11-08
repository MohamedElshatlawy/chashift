
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @select_language_title.
  ///
  /// In ar, this message translates to:
  /// **'اختر اللغة'**
  String get select_language_title;

  /// No description provided for @change_language_label.
  ///
  /// In ar, this message translates to:
  /// **'تغيير اللغة'**
  String get change_language_label;

  /// No description provided for @settings.
  ///
  /// In ar, this message translates to:
  /// **'الإعدادات'**
  String get settings;

  /// No description provided for @working_hours.
  ///
  /// In ar, this message translates to:
  /// **'ساعات عملي'**
  String get working_hours;

  /// No description provided for @active.
  ///
  /// In ar, this message translates to:
  /// **'نشط'**
  String get active;

  /// No description provided for @finished.
  ///
  /// In ar, this message translates to:
  /// **'منتهية'**
  String get finished;

  /// No description provided for @applied_jobs.
  ///
  /// In ar, this message translates to:
  /// **'ساعات عملي'**
  String get applied_jobs;

  /// No description provided for @resume.
  ///
  /// In ar, this message translates to:
  /// **'السيرة الذاتية'**
  String get resume;

  /// No description provided for @overview.
  ///
  /// In ar, this message translates to:
  /// **'نظره عامه'**
  String get overview;

  /// No description provided for @jobs.
  ///
  /// In ar, this message translates to:
  /// **'الوظائف'**
  String get jobs;

  /// No description provided for @profile.
  ///
  /// In ar, this message translates to:
  /// **'الملف الشخصي'**
  String get profile;

  /// No description provided for @tall.
  ///
  /// In ar, this message translates to:
  /// **'Tall'**
  String get tall;

  /// No description provided for @weight.
  ///
  /// In ar, this message translates to:
  /// **'الوزر'**
  String get weight;

  /// No description provided for @hours.
  ///
  /// In ar, this message translates to:
  /// **'ساعات '**
  String get hours;

  /// No description provided for @to.
  ///
  /// In ar, this message translates to:
  /// **'لـ'**
  String get to;

  /// No description provided for @join.
  ///
  /// In ar, this message translates to:
  /// **'التحاق'**
  String get join;

  /// No description provided for @age.
  ///
  /// In ar, this message translates to:
  /// **'العمر'**
  String get age;

  /// No description provided for @login_title.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول لكاشفت'**
  String get login_title;

  /// No description provided for @email.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني'**
  String get email;

  /// No description provided for @invalid_email.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني غير صحيح'**
  String get invalid_email;

  /// No description provided for @invalid_password.
  ///
  /// In ar, this message translates to:
  /// **'كلمة مرور خاطئة'**
  String get invalid_password;

  /// No description provided for @password.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور'**
  String get password;

  /// No description provided for @login_button.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل دخول'**
  String get login_button;

  /// No description provided for @dont_have_acount.
  ///
  /// In ar, this message translates to:
  /// **'ليس لديك حساب ؟ سجل الان'**
  String get dont_have_acount;

  /// No description provided for @current_shift.
  ///
  /// In ar, this message translates to:
  /// **'العمل الحالي'**
  String get current_shift;

  /// No description provided for @new_jobs.
  ///
  /// In ar, this message translates to:
  /// **'عروض جديدة'**
  String get new_jobs;

  /// No description provided for @applied_opportunities.
  ///
  /// In ar, this message translates to:
  /// **'ساعات عملي'**
  String get applied_opportunities;

  /// No description provided for @change_password.
  ///
  /// In ar, this message translates to:
  /// **'تغيير كلمة المرور'**
  String get change_password;

  /// No description provided for @logout.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الخروج'**
  String get logout;

  /// No description provided for @id_number.
  ///
  /// In ar, this message translates to:
  /// **'الرقم القومي'**
  String get id_number;

  /// No description provided for @invalid_id_number.
  ///
  /// In ar, this message translates to:
  /// **'رقم قومي غير صحيح'**
  String get invalid_id_number;

  /// No description provided for @phone.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف'**
  String get phone;

  /// No description provided for @invalid_phone.
  ///
  /// In ar, this message translates to:
  /// **'رقم هاتف غير صحيح'**
  String get invalid_phone;

  /// No description provided for @whats_number.
  ///
  /// In ar, this message translates to:
  /// **'رقم الواتساب'**
  String get whats_number;

  /// No description provided for @bank_iban.
  ///
  /// In ar, this message translates to:
  /// **'رقم الحساب البنكي'**
  String get bank_iban;

  /// No description provided for @invalid_bank_id.
  ///
  /// In ar, this message translates to:
  /// **'رقم غير صحيح'**
  String get invalid_bank_id;

  /// No description provided for @birthdate.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ الميلاد'**
  String get birthdate;

  /// No description provided for @invalid_date.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ غير صحيح'**
  String get invalid_date;

  /// No description provided for @height.
  ///
  /// In ar, this message translates to:
  /// **'الطول'**
  String get height;

  /// No description provided for @invalid_height.
  ///
  /// In ar, this message translates to:
  /// **'طول غير صحيح'**
  String get invalid_height;

  /// No description provided for @invalid_weight.
  ///
  /// In ar, this message translates to:
  /// **'وزن غير صحيح'**
  String get invalid_weight;

  /// No description provided for @select_city.
  ///
  /// In ar, this message translates to:
  /// **'اختر المدينة'**
  String get select_city;

  /// No description provided for @select_qualification.
  ///
  /// In ar, this message translates to:
  /// **'اختر المؤهل '**
  String get select_qualification;

  /// No description provided for @select_english_level.
  ///
  /// In ar, this message translates to:
  /// **'اختر مستوي اللغة الانجليزية'**
  String get select_english_level;

  /// No description provided for @select_computer_level.
  ///
  /// In ar, this message translates to:
  /// **'اختر مستوي الحاسب الالي'**
  String get select_computer_level;

  /// No description provided for @save_button.
  ///
  /// In ar, this message translates to:
  /// **'حفظ'**
  String get save_button;

  /// No description provided for @invalid_profile_selections.
  ///
  /// In ar, this message translates to:
  /// **'Check unselected fields (City , Qualification , English level , Computer level)'**
  String get invalid_profile_selections;

  /// No description provided for @register_title.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل حساب كاشفت'**
  String get register_title;

  /// No description provided for @name_ar.
  ///
  /// In ar, this message translates to:
  /// **'الاسم بالعربي'**
  String get name_ar;

  /// No description provided for @name_en.
  ///
  /// In ar, this message translates to:
  /// **'الاسم بالانجليزية'**
  String get name_en;

  /// No description provided for @invalid_ar_name.
  ///
  /// In ar, this message translates to:
  /// **'الاسم غير صحيح'**
  String get invalid_ar_name;

  /// No description provided for @invalid_en_name.
  ///
  /// In ar, this message translates to:
  /// **'الاسم غير صحيح'**
  String get invalid_en_name;

  /// No description provided for @register.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل'**
  String get register;

  /// No description provided for @have_account.
  ///
  /// In ar, this message translates to:
  /// **'امتلك حساب ؟ تسجيل الدخول'**
  String get have_account;

  /// No description provided for @gender.
  ///
  /// In ar, this message translates to:
  /// **'الجنس'**
  String get gender;

  /// No description provided for @male.
  ///
  /// In ar, this message translates to:
  /// **'ذكر'**
  String get male;

  /// No description provided for @female.
  ///
  /// In ar, this message translates to:
  /// **'انثي'**
  String get female;

  /// No description provided for @start.
  ///
  /// In ar, this message translates to:
  /// **'ابدء الدوام'**
  String get start;

  /// No description provided for @finish.
  ///
  /// In ar, this message translates to:
  /// **'إنهاء الدوام'**
  String get finish;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
