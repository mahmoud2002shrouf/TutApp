import 'package:advanced_flutter_arabic/app/app_prefs.dart';
import 'package:advanced_flutter_arabic/app/constance.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "langauge";

class DioFactory {
  final AppPrefrances _appPrefrances;
  DioFactory(this._appPrefrances);
  Future<Dio> getDio() async {
    Dio dio = Dio();
  String? langauge =await _appPrefrances.getAppLanguage();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Constance.token,
      DEFAULT_LANGUAGE: langauge!  // todo get lang from app prefs
    };

    dio.options = BaseOptions(
        baseUrl: Constance.baseUrl,
        headers: headers,
        receiveTimeout: const Duration(milliseconds: Constance.apiTimeOut),
        sendTimeout: const Duration(milliseconds: Constance.apiTimeOut));

    if (!kReleaseMode) {
      // its debug mode so print app logs
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}
