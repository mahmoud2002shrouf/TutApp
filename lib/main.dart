import 'package:advanced_flutter_arabic/app/di.dart';
import 'package:advanced_flutter_arabic/presentation/resources/language_manegar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'app/app.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await initAppModule();

  runApp(EasyLocalization(supportedLocales: const [ARABIC_LOCAL,ENGLISH_LOCAL], path: ASSETS_PATH_LOCALIZATION, child:Phoenix(child: MyApp())));
}
