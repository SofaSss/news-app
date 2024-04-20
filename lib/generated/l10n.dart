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

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Все новости`
  String get allNews {
    return Intl.message(
      'Все новости',
      name: 'allNews',
      desc: '',
      args: [],
    );
  }

  /// `Перейти в источник`
  String get goToTheSource {
    return Intl.message(
      'Перейти в источник',
      name: 'goToTheSource',
      desc: '',
      args: [],
    );
  }

  /// `Новости`
  String get newsApp {
    return Intl.message(
      'Новости',
      name: 'newsApp',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка `
  String get error {
    return Intl.message(
      'Ошибка ',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Попробовать снова`
  String get tryAgain {
    return Intl.message(
      'Попробовать снова',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Новости`
  String get News {
    return Intl.message(
      'Новости',
      name: 'News',
      desc: '',
      args: [],
    );
  }

  /// `Кликер`
  String get Counter {
    return Intl.message(
      'Кликер',
      name: 'Counter',
      desc: '',
      args: [],
    );
  }

  /// `Меню`
  String get Menu {
    return Intl.message(
      'Меню',
      name: 'Menu',
      desc: '',
      args: [],
    );
  }

  /// `Счетчик`
  String get counter {
    return Intl.message(
      'Счетчик',
      name: 'counter',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка`
  String get eror {
    return Intl.message(
      'Ошибка',
      name: 'eror',
      desc: '',
      args: [],
    );
  }

  /// `Найти новость`
  String get SearchNews {
    return Intl.message(
      'Найти новость',
      name: 'SearchNews',
      desc: '',
      args: [],
    );
  }

  /// `Авторизация`
  String get authorization {
    return Intl.message(
      'Авторизация',
      name: 'authorization',
      desc: '',
      args: [],
    );
  }

  /// `Регистрация`
  String get sign_up {
    return Intl.message(
      'Регистрация',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
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
