import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    foregroundColor: Colors.black,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
  listTileTheme: const ListTileThemeData(
    tileColor: Colors.white,
    contentPadding: EdgeInsets.only(left: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    subtitleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      foregroundColor: Colors.black,
      side: const BorderSide(color: Colors.black, width: 2),
      padding: const EdgeInsets.all(16),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
      padding: const EdgeInsets.all(16),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    elevation: 4,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black,
    selectionColor: Colors.black26,
    selectionHandleColor: Colors.black,
  ),
  inputDecorationTheme: InputDecorationTheme(
    alignLabelWithHint: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Colors.black, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Colors.black, width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Colors.black, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
    labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
    hintStyle: const TextStyle(color: Colors.black, fontSize: 16),
    errorStyle: const TextStyle(color: Colors.red, fontSize: 16),
  ),
);
