import 'package:ecommerce_mobile/presentation/base/controller/app_settings_controller.dart';
import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/theme.dart';
import 'package:ecommerce_mobile/presentation/base/utils/app_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'presentation/usermanagement/login/screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppBindings().dependencies();
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
  late final UserController _userController;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    _settingsController = Get.find();
    _userController = Get.find();
    _userController.getSavedUser();
    setLocale(Locale(_settingsController.getLanguage()));
  }

  @override
  Widget build(BuildContext context) {
    var theme =
        CustomTheme.lightTheme(_settingsController.getLanguage() == "ar");
    return GetMaterialApp(
      locale: _locale,
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: theme,
      home: LoginScreen(),
      translations: Language(),
    );
  }
}
