import 'dart:async';

import 'package:advanced_flutter_arabic/presentation/resources/language_manegar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LAN = "PREFS_KEY_LAN";
const String PREFS_KEY_IS_SHOW_ONBORDING = " PREFS_KEY_IS_SHOW_ONBORDING";
const String PREFS_KEY_IS_USER_LOGIN = "PREFS_KEY_IS_USER_LOGIN";

class AppPrefrances {
  final SharedPreferences _sharedPreferences;
  AppPrefrances(this._sharedPreferences);
  Future<String?> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LAN);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> setAppLang() async {
    String? curantLang = await getAppLanguage();
    if (curantLang == LanguageType.ENGLISH.getValue()) {
      _sharedPreferences.setString(
          PREFS_KEY_LAN, LanguageType.ARABIC.getValue());
    } else {
      _sharedPreferences.setString(
          PREFS_KEY_LAN, LanguageType.ENGLISH.getValue());
    }
  }
  Future<Locale> getLocal() async {
    String? curantLang = await getAppLanguage();
    if (curantLang == LanguageType.ENGLISH.getValue()) {
     return ENGLISH_LOCAL;
    } else {
      return ARABIC_LOCAL;
    }
  }

  Future setIsShowInbording() async {
    _sharedPreferences.setBool(PREFS_KEY_IS_SHOW_ONBORDING, true);
  }

  Future<bool> getIsShowInbording() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_SHOW_ONBORDING) ?? false;
  }

  Future setIsuserLogin() async {
    _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGIN, true);
  }

  Future<bool> getIsuserLogin() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGIN) ?? false;
  }

  Future<bool> logout() async {
    return _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGIN);
  }
}
