import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trafficlightsiot/resources/app_colors.dart';
import 'package:trafficlightsiot/resources/locales.dart';
import 'package:trafficlightsiot/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Walker App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
        primaryColor: AppColors.PRIMARY_COLOR,
        accentColor: Color(0xFF26B45F),
        iconTheme: IconThemeData(color: AppColors.BUTTON_BACKGROUND_COLOR),
        primaryIconTheme:
            IconThemeData(color: AppColors.BUTTON_BACKGROUND_COLOR),
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: AppColors.ONSURFACE_COLOR),
        ),
        errorColor: AppColors.CRITICAL_COLOR,
        hintColor: AppColors.PLACEHOLDER_TEXT,
        scaffoldBackgroundColor: AppColors.BACKGROUND_COLOR,
        dividerColor: AppColors.SEPARATOR,
        hoverColor: AppColors.HOVER_COLOR,
        focusColor: AppColors.FOCUS_COLOR,
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: AppColors.LABEL_COLOR,
            fontWeight: FontWeight.bold,
          ),
        ),
        buttonColor: AppColors.PRIMARY_COLOR,
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          buttonColor: AppColors.PRIMARY_COLOR,
          disabledColor: AppColors.DISABLED_BUTTON,
          height: 50,
        ),
      ),
      translations: Locales(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('es'),
      home: Home(),
    );
  }
}
