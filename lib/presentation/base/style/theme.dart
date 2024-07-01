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
        useMaterial3: false,
        scaffoldBackgroundColor: AppColors.lightGrayColor20,
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(AppColors.ceruleanBlueColor),
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
            foregroundColor: AppColors.blackColor,
            centerTitle: true),
        navigationBarTheme: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                fontFamily: appFont,
                fontSize: 12,
                color: AppColors.ceruleanBlueColor))),
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
              borderRadius: BorderRadius.circular(8.0),
            ),
            backgroundColor: AppColors.ceruleanBlueColor,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            side: const BorderSide(color: AppColors.ceruleanBlueColor),
          ),
        ),dataTableTheme: const DataTableThemeData(
          dividerThickness: 0.4,
        ));
  }
}
