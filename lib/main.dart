import 'dart:io';

import 'package:ecommerce_mobile/presentation/base/controller/app_settings_controller.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/model/constants.dart';
import 'package:ecommerce_mobile/presentation/base/style/theme.dart';
import 'package:ecommerce_mobile/presentation/base/utils/app_bindings.dart';
import 'package:ecommerce_mobile/presentation/home/screen/home_container_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppBindings().dependencies();
  if (Platform.isIOS) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: firebaseApiKey,
            appId: firebaseAppId,
            messagingSenderId: firebaseMessagingSenderId,
            projectId: firebaseProjectId));
  } else {
    await Firebase.initializeApp();
  }
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Locale _locale;
  late final AppSettingsController _settingsController;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    _settingsController = Get.find();
    _settingsController.getSettings();
    setLocale(Locale(_settingsController.getLanguage()));
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme =
        CustomTheme.lightTheme(_settingsController.getLanguage() == "ar");
    return GetMaterialApp(
      locale: _locale,
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: theme,
      home: const HomeContainerScreen(),
      translations: Language(),
    );
  }
}
