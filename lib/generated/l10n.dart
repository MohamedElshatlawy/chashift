// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Select language`
  String get select_language_title {
    return Intl.message(
      'Select language',
      name: 'select_language_title',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get change_language_label {
    return Intl.message(
      'Change language',
      name: 'change_language_label',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Working hours`
  String get working_hours {
    return Intl.message(
      'Working hours',
      name: 'working_hours',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message(
      'Active',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Finished`
  String get finished {
    return Intl.message(
      'Finished',
      name: 'finished',
      desc: '',
      args: [],
    );
  }

  /// `Applied jobs`
  String get applied_jobs {
    return Intl.message(
      'Applied jobs',
      name: 'applied_jobs',
      desc: '',
      args: [],
    );
  }

  /// `My resume`
  String get resume {
    return Intl.message(
      'My resume',
      name: 'resume',
      desc: '',
      args: [],
    );
  }

  /// `Overview`
  String get overview {
    return Intl.message(
      'Overview',
      name: 'overview',
      desc: '',
      args: [],
    );
  }

  /// `Jobs`
  String get jobs {
    return Intl.message(
      'Jobs',
      name: 'jobs',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Tall`
  String get tall {
    return Intl.message(
      'Tall',
      name: 'tall',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weight {
    return Intl.message(
      'Weight',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `hours`
  String get hours {
    return Intl.message(
      'hours',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Join`
  String get join {
    return Intl.message(
      'Join',
      name: 'join',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Login Into Cashift`
  String get login_title {
    return Intl.message(
      'Login Into Cashift',
      name: 'login_title',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get invalid_email {
    return Intl.message(
      'Invalid email',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Invalid password`
  String get invalid_password {
    return Intl.message(
      'Invalid password',
      name: 'invalid_password',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_button {
    return Intl.message(
      'Login',
      name: 'login_button',
      desc: '',
      args: [],
    );
  }

  /// `Don\'t have an account? Register now`
  String get dont_have_acount {
    return Intl.message(
      'Don\\\'t have an account? Register now',
      name: 'dont_have_acount',
      desc: '',
      args: [],
    );
  }

  /// `Current Shift`
  String get current_shift {
    return Intl.message(
      'Current Shift',
      name: 'current_shift',
      desc: '',
      args: [],
    );
  }

  /// `New Jobs`
  String get new_jobs {
    return Intl.message(
      'New Jobs',
      name: 'new_jobs',
      desc: '',
      args: [],
    );
  }

  /// `Applied ApplyOpportunities`
  String get applied_opportunities {
    return Intl.message(
      'Applied ApplyOpportunities',
      name: 'applied_opportunities',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Id Number`
  String get id_number {
    return Intl.message(
      'Id Number',
      name: 'id_number',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Id Number`
  String get invalid_id_number {
    return Intl.message(
      'Invalid Id Number',
      name: 'invalid_id_number',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone {
    return Intl.message(
      'Phone Number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Invalid PhoneNumber`
  String get invalid_phone {
    return Intl.message(
      'Invalid PhoneNumber',
      name: 'invalid_phone',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp Number`
  String get whats_number {
    return Intl.message(
      'WhatsApp Number',
      name: 'whats_number',
      desc: '',
      args: [],
    );
  }

  /// `Bank Account Number`
  String get bank_iban {
    return Intl.message(
      'Bank Account Number',
      name: 'bank_iban',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Bank account`
  String get invalid_bank_id {
    return Intl.message(
      'Invalid Bank account',
      name: 'invalid_bank_id',
      desc: '',
      args: [],
    );
  }

  /// `BirthDate`
  String get birthdate {
    return Intl.message(
      'BirthDate',
      name: 'birthdate',
      desc: '',
      args: [],
    );
  }

  /// `Invalid date`
  String get invalid_date {
    return Intl.message(
      'Invalid date',
      name: 'invalid_date',
      desc: '',
      args: [],
    );
  }

  /// `Height`
  String get height {
    return Intl.message(
      'Height',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `invalid height`
  String get invalid_height {
    return Intl.message(
      'invalid height',
      name: 'invalid_height',
      desc: '',
      args: [],
    );
  }

  /// `Invalid weight`
  String get invalid_weight {
    return Intl.message(
      'Invalid weight',
      name: 'invalid_weight',
      desc: '',
      args: [],
    );
  }

  /// `Select City`
  String get select_city {
    return Intl.message(
      'Select City',
      name: 'select_city',
      desc: '',
      args: [],
    );
  }

  /// `Select Qualification `
  String get select_qualification {
    return Intl.message(
      'Select Qualification ',
      name: 'select_qualification',
      desc: '',
      args: [],
    );
  }

  /// `Select English Level`
  String get select_english_level {
    return Intl.message(
      'Select English Level',
      name: 'select_english_level',
      desc: '',
      args: [],
    );
  }

  /// `Select Computer Level`
  String get select_computer_level {
    return Intl.message(
      'Select Computer Level',
      name: 'select_computer_level',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save_button {
    return Intl.message(
      'Save',
      name: 'save_button',
      desc: '',
      args: [],
    );
  }

  /// `Check unselected fields (City , Qualification , English level , Computer level)`
  String get invalid_profile_selections {
    return Intl.message(
      'Check unselected fields (City , Qualification , English level , Computer level)',
      name: 'invalid_profile_selections',
      desc: '',
      args: [],
    );
  }

  /// `Register Into Cashift`
  String get register_title {
    return Intl.message(
      'Register Into Cashift',
      name: 'register_title',
      desc: '',
      args: [],
    );
  }

  /// `Name in arabic`
  String get name_ar {
    return Intl.message(
      'Name in arabic',
      name: 'name_ar',
      desc: '',
      args: [],
    );
  }

  /// `Name in english`
  String get name_en {
    return Intl.message(
      'Name in english',
      name: 'name_en',
      desc: '',
      args: [],
    );
  }

  /// `Invalid arabic name`
  String get invalid_ar_name {
    return Intl.message(
      'Invalid arabic name',
      name: 'invalid_ar_name',
      desc: '',
      args: [],
    );
  }

  /// `Invalid english name`
  String get invalid_en_name {
    return Intl.message(
      'Invalid english name',
      name: 'invalid_en_name',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `have an account? Login `
  String get have_account {
    return Intl.message(
      'have an account? Login ',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message(
      'Finish',
      name: 'finish',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
