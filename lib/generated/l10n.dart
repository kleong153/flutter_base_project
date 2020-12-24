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
// ignore_for_file: avoid_redundant_argument_values

class Lang {
  Lang();
  
  static Lang current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<Lang> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      Lang.current = Lang();
      
      return Lang.current;
    });
  } 

  static Lang of(BuildContext context) {
    return Localizations.of<Lang>(context, Lang);
  }

  /// `Flutter Base Project`
  String get app_title {
    return Intl.message(
      'Flutter Base Project',
      name: 'app_title',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Cannot connect to server, please retry.`
  String get cannot_connect_to_server_please_retry {
    return Intl.message(
      'Cannot connect to server, please retry.',
      name: 'cannot_connect_to_server_please_retry',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get info {
    return Intl.message(
      'Info',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Logged out.`
  String get logged_out {
    return Intl.message(
      'Logged out.',
      name: 'logged_out',
      desc: '',
      args: [],
    );
  }

  /// `Logging in...`
  String get logging_in {
    return Intl.message(
      'Logging in...',
      name: 'logging_in',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
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

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Only accept integer.`
  String get only_accept_integer {
    return Intl.message(
      'Only accept integer.',
      name: 'only_accept_integer',
      desc: '',
      args: [],
    );
  }

  /// `Only accept numeric.`
  String get only_accept_numeric {
    return Intl.message(
      'Only accept numeric.',
      name: 'only_accept_numeric',
      desc: '',
      args: [],
    );
  }

  /// `Oops!`
  String get oops {
    return Intl.message(
      'Oops!',
      name: 'oops',
      desc: '',
      args: [],
    );
  }

  /// `Please login.`
  String get please_login {
    return Intl.message(
      'Please login.',
      name: 'please_login',
      desc: '',
      args: [],
    );
  }

  /// `Request error, please retry.`
  String get request_error_please_retry {
    return Intl.message(
      'Request error, please retry.',
      name: 'request_error_please_retry',
      desc: '',
      args: [],
    );
  }

  /// `Required field.`
  String get required_field {
    return Intl.message(
      'Required field.',
      name: 'required_field',
      desc: '',
      args: [],
    );
  }

  /// `Re-type Password`
  String get retype_password {
    return Intl.message(
      'Re-type Password',
      name: 'retype_password',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Lang> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Lang> load(Locale locale) => Lang.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}