import 'package:flutter/material.dart';

import 'constants/color_store.dart';

class Themes {
  static final lightTheme = ThemeData.light().copyWith(
      backgroundColor: const Color(0xFFFFFFFF),
      dialogBackgroundColor: const Color(0xFF936aa9),
      primaryColor: const Color(0xFFC499DB),
      hintColor: Colors.grey[700],
      disabledColor: ColorStore.fontBasicColor,
      secondaryHeaderColor: const Color(0xFFA8A8A8),
      errorColor: const Color(0xFF7D0633),
      splashColor: const Color(0xFFC499DB),
      highlightColor: const Color(0xFFf7caff),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xFFC499DB),
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xFFC499DB),
        )),
        labelStyle: TextStyle(color: Color(0xFF373737), fontSize: 16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
        ),
        onPrimary: Colors.white,
        primary: const Color(0xFFC499DB),
        minimumSize: const Size(88, 36),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            primary: const Color(0xFFC499DB),
            minimumSize: const Size(88, 36),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
            side: const BorderSide(color: Color(0xFFC499DB), width: 1)),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        primary: const Color(0xFFC499DB),
        minimumSize: const Size(88, 36),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        ),
      )),
      textTheme: TextTheme(
        headline1: const TextStyle(
            fontSize: 38.0,
            fontWeight: FontWeight.bold,
            color: ColorStore.fontBasicColor),
        headline2: const TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            color: ColorStore.fontBasicColor),
        headline3: const TextStyle(
            fontSize: 34.0,
            fontWeight: FontWeight.bold,
            color: ColorStore.fontBasicColor),
        headline4: const TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: ColorStore.fontBasicColor),
        headline5: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: ColorStore.fontBasicColor),
        headline6: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: ColorStore.fontBasicColor),
        subtitle1: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: ColorStore.fontBasicColor),
        subtitle2: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            color: ColorStore.fontBasicColor),
        bodyText1: const TextStyle(
          fontSize: 16.0,
        ),
        bodyText2: const TextStyle(
          fontSize: 14.0,
        ),
        caption: TextStyle(fontSize: 12.0, color: Colors.grey[400]),
        button: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            color: Color(0xFFFFFFFF)),
        overline: const TextStyle(fontSize: 14.0),
      ).apply(bodyColor: ColorStore.fontBasicColor, fontFamily: 'NanumGothic'));
}
