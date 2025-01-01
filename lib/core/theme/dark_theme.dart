import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    surfaceTintColor: Colors.black,
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
  listTileTheme: const ListTileThemeData(
    tileColor: Colors.black,
    contentPadding: EdgeInsets.only(left: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    subtitleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      foregroundColor: Colors.white,
      side: const BorderSide(color: Colors.white, width: 2),
      padding: const EdgeInsets.all(16),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      padding: const EdgeInsets.all(16),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 4,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.white,
    selectionColor: Colors.white24,
    selectionHandleColor: Colors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    alignLabelWithHint: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Colors.white, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Colors.white, width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Colors.white, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
    labelStyle: const TextStyle(color: Colors.white, fontSize: 16),
    hintStyle: const TextStyle(color: Colors.white, fontSize: 16),
    errorStyle: const TextStyle(color: Colors.red, fontSize: 16),
  ),
);
