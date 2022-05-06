import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  appBarTheme: const AppBarTheme(foregroundColor: Colors.white),
  textTheme: const TextTheme(
    bodyText1: TextStyle(fontSize: 16),
    button: TextStyle(
      letterSpacing: 1.5,
      fontWeight: FontWeight.bold,
    ),
    headline1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    subtitle1: TextStyle(
      color: Colors.grey,
    ),
  ),
  buttonTheme: const ButtonThemeData(),
  primarySwatch: const MaterialColor(
    0xFF526E2D,
    <int, Color>{
      50: Color(0x00526E2D),
      100: Color(0x1A526E2D),
      200: Color(0x33526E2D),
      300: Color(0x66526E2D),
      400: Color(0x80526E2D),
      500: Color(0x99526E2D),
      600: Color(0xB3526E2D),
      700: Color(0xCC526E2D),
      800: Color(0xE6526E2D),
      900: Color(0xFF526E2D),
    },
  ),
  primaryColor: const Color(0xFF526E2D),
  hintColor: const Color(0xFF69C8EC),
);
