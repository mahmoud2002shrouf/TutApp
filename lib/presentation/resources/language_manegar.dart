import 'package:flutter/material.dart';

enum LanguageType { ENGLISH, ARABIC }
const String ARABIC="ar";
const String ENGLISH="en";
const Locale ARABIC_LOCAL=Locale("ar","SA");
const Locale ENGLISH_LOCAL=Locale("en","US");
const String ASSETS_PATH_LOCALIZATION="assets/translations";
extension LanguageTypeExtention on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ARABIC;
      case LanguageType.ARABIC:
        return ENGLISH;
    }
  }
}
