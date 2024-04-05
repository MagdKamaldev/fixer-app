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

  /// `skip`
  String get skip {
    return Intl.message(
      'skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Connect users with skilled \n craftsmen instantly.`
  String get onBoardingText1 {
    return Intl.message(
      'Connect users with skilled \n craftsmen instantly.',
      name: 'onBoardingText1',
      desc: '',
      args: [],
    );
  }

  /// `Recieve competitive bids,\n compare prices,and make \n informed decisions.`
  String get onBoardingText2 {
    return Intl.message(
      'Recieve competitive bids,\n compare prices,and make \n informed decisions.',
      name: 'onBoardingText2',
      desc: '',
      args: [],
    );
  }

  /// `Make hassle-free transcations \n within the app for peace of \n mind.`
  String get onBoardingText3 {
    return Intl.message(
      'Make hassle-free transcations \n within the app for peace of \n mind.',
      name: 'onBoardingText3',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back !`
  String get welcome {
    return Intl.message(
      'Welcome Back !',
      name: 'welcome',
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

  /// `Enter your email`
  String get emailform {
    return Intl.message(
      'Enter your email',
      name: 'emailform',
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

  /// `Enter your password`
  String get passwordform {
    return Intl.message(
      'Enter your password',
      name: 'passwordform',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get remember {
    return Intl.message(
      'Remember me',
      name: 'remember',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgot {
    return Intl.message(
      'Forgot Password',
      name: 'forgot',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signin {
    return Intl.message(
      'Sign in',
      name: 'signin',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with google`
  String get withgoogle {
    return Intl.message(
      'Sign in with google',
      name: 'withgoogle',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get noaccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'noaccount',
      desc: '',
      args: [],
    );
  }

  /// ` Sign up`
  String get signup {
    return Intl.message(
      ' Sign up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `YOUR FIX , OUR EXPERTISE.`
  String get slogan {
    return Intl.message(
      'YOUR FIX , OUR EXPERTISE.',
      name: 'slogan',
      desc: '',
      args: [],
    );
  }

  /// `Browse craftsmen for repair \n and maintainance service`
  String get getsatrtintro {
    return Intl.message(
      'Browse craftsmen for repair \n and maintainance service',
      name: 'getsatrtintro',
      desc: '',
      args: [],
    );
  }

  /// `Let’s get started `
  String get getstart {
    return Intl.message(
      'Let’s get started ',
      name: 'getstart',
      desc: '',
      args: [],
    );
  }

  /// `Sign up as user`
  String get signup_user {
    return Intl.message(
      'Sign up as user',
      name: 'signup_user',
      desc: '',
      args: [],
    );
  }

  /// `Sign up as craftsman`
  String get signup_craft {
    return Intl.message(
      'Sign up as craftsman',
      name: 'signup_craft',
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
