import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/asset_resource.dart';
import 'colors.dart';

class CustomTheme {
  static ThemeData lightTheme(bool isRTL) {
    String appFont =
        isRTL ? AssetResource.arabicFontName : AssetResource.englishFontName;

    return ThemeData(
        indicatorColor: Colors.transparent,
        primaryColor: AppColors.whiteColor,
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.mainColor),
          ),
          labelStyle: TextStyle(color: AppColors.mainColor),
        ),
        useMaterial3: false,
        scaffoldBackgroundColor: AppColors.whiteColor,
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.all(AppColors.mainColor),
        ),
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: AppColors.whiteColor,
              // Status bar brightness
              statusBarIconBrightness: Brightness.dark,
              // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            backgroundColor: AppColors.whiteColor,
            foregroundColor: AppColors.mainColor,
            centerTitle: true),
        navigationBarTheme: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.all<TextStyle>(TextStyle(
                fontFamily: appFont,
                fontSize: 12,
                color: AppColors.mainColor))),
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontFamily: appFont),
          bodySmall: TextStyle(fontFamily: appFont),
          titleSmall: TextStyle(fontFamily: appFont),
          bodyLarge: TextStyle(fontFamily: appFont),
          headlineMedium:
              TextStyle(fontFamily: appFont, fontWeight: FontWeight.bold),
          headlineSmall:
              TextStyle(fontFamily: appFont, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontFamily: appFont),
          titleMedium: TextStyle(fontFamily: appFont),
          labelSmall: TextStyle(fontFamily: appFont),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            elevation: 0,
            backgroundColor: AppColors.mainColor,
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.all(AppColors.black12),
          checkColor: WidgetStateProperty.all(AppColors.mainColor),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            side: const BorderSide(color: AppColors.mainColor),
          ),
        ));
  }
}
