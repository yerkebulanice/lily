import 'package:flutter/material.dart';
import 'package:lily/app/core/localization/custom_locale.dart';

class CustomLocalization {
  static const CustomLocale en = CustomLocale(
    locale: Locale('en'),
    name: "English",
  );
  static const CustomLocale ru = CustomLocale(
    locale: Locale('ru'),
    name: "Русский",
  );
  static const List<CustomLocale> customLocales = [ru, en];

  static Locale get fallbackLocale => customLocales[0].locale;

  static List<Locale> get getLocales {
    return customLocales.map((CustomLocale locale) => locale.locale).toList();
  }
}
